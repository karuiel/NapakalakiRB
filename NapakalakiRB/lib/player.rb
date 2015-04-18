#!/usr/bin/env ruby
#encoding: utf-8


require_relative "treasure.rb"
require_relative "monster.rb"
require_relative "bad_consequence.rb"
module Model
  class Player

    attr_reader :MAXHIDDENTREASURES 
    attr_reader :hiddenTreasures
    attr_reader :visibleTreasures
    attr_reader :name
    @@MAXHIDDENTREASURES = 4


    def initialize(name)
      @dead = false
      @name = name
      @level = 1
      @visibleTreasures = Array.new
      @hiddenTreasures = Array.new
      @pendingBadConsequence = BadConsequence.newDeath("vacío", false)
      initTreasures
    end

      def getCombatLevel
        @combatLevel
      end
      
      def getHiddenTreasures
        @hiddenTreasures
      end
      
      def getVisibleTreasures
        @visibleTreasures
      end
    
      def getName
        @name
      end
    #EXAMEN
    def setVisibleTreasureList vl
      @visibleTreasures = vl
      
    end
    
    def setHiddenTreasureList ht
      @hiddenTreasures = ht
    end
    
    #FINEXAMEN
    
    
    def bringToLife  
      @dead = false    
    end  

    def incrementLevels(l)
      if(l>0)
        if((@level + l)>10)
          @level=10
        else
          @level += l
        end
      end
    end  

    def  decrementLevels(l)
      if(l>0)
        if((@level - l)<=0)
          @level=1
        else
          @level -= l
        end
      end
    end  


    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end  

    def die
      dealer = CardDealer.instance
      @dead = true
        @visibleTreasures.each{|x|
            dealer.giveTreasureBack(x)
        }
        @visibleTreasures.clear
        
        @hiddenTreasures.each{|x|
            dealer.giveTreasureBack(x)
        }
        @hiddenTreasures.clear
           
    end

    def discardNecklaceIfVisible
      dealer = CardDealer.instance
        @visibleTreasures.each{|x|
            if x.type==TreasureKind::NECKLACE
                dealer.giveTreasureBack(x)
                @visibleTreasures.delete(x)
            end
        }
      
    end

    def dieIfNoTreasures
      if(@visibleTreasures.size == 0 && @hiddenTreasures.size == 0)
        @dead=true
      end
    end  

    def canIBuyLevels(l)
      if((@level + l)<10)
        true
      else
        false
      end
    end  

    def computeGoldCoinsValue(t)
      coins = 0
        t.each{|x|
          coins += x.getGoldCoins()
        }
        
        levels = coins / 1000
        levels
    end

    def applyPrize(p)
        nLevels = p.levels
        incrementLevels(nLevels)
        dealer = CardDealer.instance
        nPrize = p.treasures
        
        for i in (1..nPrize)
            treasure = dealer.nextTreasure()
            @hiddenTreasures << treasure
        end     
    end

    def combat(m)
        myLevel = getCombatLevel
        levelMonster = m.getCombatLevel 
        
        if myLevel > levelMonster
            prize = m.getPrize
            applyPrize(prize)
            if(@level < 10)
                result = CombatResult::WIN
            
            else
                result = CombatResult::WINANDWINGAME
            end   
        
        else
            dice = Dice.instance
            escape = dice.nextNumber
            if(escape < 5)
                bad = m.getBadConsequence()
                amIDead = bad.kills()
                
                if(amIDead)
                    die()
                    result = CombatResult::LOSEANDDIE
                
                else
                    applyBadConsequence(bad)
                    result = CombatResult::LOSE
                end
            
            else
                result = CombatResult::LOSEANDESCAPE
            
            end
        end    
        discardNecklaceIfVisible()
        return result
      
    end

    def applyBadConsequence(bad)
      nLevels = bad.levels
      decrementLevels(nLevels)
      pendingBad = bad.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)     
    end

    def makeTreasureVisible(t)

      if(canMakeTreasureVisible(t))
        @visibleTreasures << t
        @hiddenTreasures.delete(t) 
        canMake = true;
      
      else       
           canMake = false;
      end
      canMake
    end  

    def contains(treasures, t)
        repetitions = 0
        treasures.each{|x|
            if (x.type == t)
              repetitions +=1
            end
        }
        repetitions
    end
     
    def canMakeTreasureVisible(t)
        type = t.type
        canMake = false
         
        if ((type == TreasureKind::ONEHAND) || (type == TreasureKind::BOTHHANDS))
            if contains(@visibleTreasures,TreasureKind::BOTHHANDS)==0
                onehand = contains(@visibleTreasures,TreasureKind::ONEHAND)
                if(((onehand < 2) && (type == TreasureKind::ONEHAND)) ||
                         ((onehand == 0) && (TreasureKind::BOTHHANDS == type)))
                    canMake = true
                end
            end
        else
            canMake = (contains(@visibleTreasures,type) == 0)
        end
        canMake
        
    end  

    def discardVisibleTreasure(t)
        @visibleTreasures.delete(t)
        if( (!@pendingBadConsequence.isEmpty()))
            @pendingBadConsequence.substractVisibleTreasure(t)
        end
        dealer = CardDealer.instance
        dealer.giveTreasureBack(t)
        dieIfNoTreasures()
    end 

    def discardHiddenTreasure(t)
        @hiddenTreasures.delete(t)
        if( (!@pendingBadConsequence.isEmpty()))
            @pendingBadConsequence.substractVisibleTreasure(t)
        end
        dealer = CardDealer.instance
        dealer.giveTreasureBack(t)
        dieIfNoTreasures()
    end

    def buyLevels(visible, hidden)
        levels = computeGoldCoinsValue(visible)
        levels += computeGoldCoinsValue(hidden)
        canI = canIBuyLevels(levels.to_i)
        
        if(canI)
            incrementLevels(levels.to_i)
            visible.each{|v|
                discardVisibleTreasure(v)
            }
            hidden.each{|h|
                discardHiddenTreasure(h)
            }
        end
        return canI;
    end

    def getCombatLevel
      total_level = @level
      collar = false

      #Bucle de búsqueda del collar
      @visibleTreasures.each{|x|
        if(x.type == TreasureKind::NECKLACE)
          collar=true
        end
      }

      #Bucles de recuento de niveles
      if(collar==true)
        @visibleTreasures.each{|x|
          total_level += x.maxBonus
        }
      else
        @visibleTreasures.each{|x|
          total_level += x.minBonus
        }
      end
      total_level
    end

    def validState
      valid = true
      if(!@pendingBadConsequence.isEmpty() || @hiddenTreasures.size>4)
        valid = false
      end
      valid
    end

    def initTreasures
        bringToLife
        dealer = CardDealer.instance
        dice = Dice.instance
        number = dice.nextNumber()
        
        if number == 1
            treasure = dealer.nextTreasure()
            @hiddenTreasures << treasure
        
        elsif number < 6 
            for i in (0..1)
                treasure = dealer.nextTreasure
                @hiddenTreasures << treasure
            end
        elsif number == 6
            for j in (0..2)
                treasure = dealer.nextTreasure
                @hiddenTreasures << treasure
            end            
        end    
        return true    
    end  

    def isDead
      @dead
    end

    def hasVisibleTreasures
      hasV = true
      if(@visibleTreasures.size == 0)
        hasV = false
      end
      hasV
    end 

    def to_s
       "Nombre: #{@name}\t nivel: #{@level}" 
    end
    
    private :bringToLife
    private :incrementLevels
    private :decrementLevels
    private :setPendingBadConsequence
    private :die
    private :discardNecklaceIfVisible
    private :dieIfNoTreasures
    private :canIBuyLevels
    private :contains
    protected :computeGoldCoinsValue

  end
end  