#!/usr/bin/env ruby
#encoding: utf-8

#NOTA: 
#preguntar lo del collar.
#¿Que pasa con la constante?

class Player
  
  #attr_reader :MAXHIDDENTREASURES = 4 
  attr_reader :hiddenTreasures
  attr_reader :visibleTreasures
  

  
  def initialize(name)
    @dead = false
    @name = name
    @level = 1
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
  end
 
  def bringToLive  
    @dead = false    
  end  
  
  def incrementLevels(l)
    if(l>0)
      if((@levels + l)>10)
        @levels=10
      else
        @levels += l
      end
    end
  end  
  
  def  decrementLevels(l)
    if(l>0)
      if((@levels - l)<=0)
        @levels=1
      else
        @levels -= l
      end
    end
  end  
  
   
  def setPendingBadConsequence(b)
    @pendingBadConsequence = b
  end  
  
  def die
  end
 
  def discardNecklaceIfVisible
  end
  
  def dieIfNoTreasures
    if(@visibleTreasures.size == 0 && @hiddenTreasures.size == 0)
      @dead=true
    end
  end  
  
  def canIBuyLevels(l)
    if((@levels + l)<10)
      true
    else
      false
    end
  end  
    
  def computeGoldCoinsValue(t)
  end
  
  def applyPrize(p)
  end
  
  def combat(m)
  end
  
  def applyBadConsequence(bad)
  end
  
  def makeTreasureVisible(t)
  end  
  
  def canMakeTreasurevisible(t)
  end  
  
  def discardVisibleTreasure(t)
  end 
  
  def discardHiddenTreasure(t)
  end
  
  def buyLevels(visible, hidden)
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
      @visibleTreasure.each{|x|
        total_level += x.minBonus
      }
    end
    total_level
  end
  
  def validState
    if(@pendingBadConsequence.isEmpty() && @hiddenTreasures.size<=4)
      true
    else
      false
    end
  end
  
  def  initTreasures
  end  
  
  def isDead
    @dead
  end
  
  def hasVisibleTreasures
    if(@visibleTreasures.size = 0)
      false
    else
      true
    end
  end 
  
  private :bringToLive
  private :incrementLevels
  private :decrementLevels
  private :setPendingBadConsequence
  private :die
  private :discardNecklaceIfVisible
  private :dieIfNoTreasures
  private :canIBuyLevels
  protected :computeGoldCoinsValue
  
end