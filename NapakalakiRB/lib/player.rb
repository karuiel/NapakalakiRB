#!/usr/bin/env ruby
#encoding: utf-8

#NOTA: revisar el initialize a ver si esta bien. reader de level¿?(creo que no)
# no hay getter de level, pero tampoco de name o de dead
#preguntar lo del collar.
#¿Que pasa con la constante?
#Get combatLevel: no inicializas el valor de level a 0. no hace falta comprobar 
#este vacío o no el vector, si no no entra y ya está
#los metodos privados no se hacen asi: se pone justo delante de cada método 
#a la hora dedefinirlo: hecho en bringToLive
#no comparar las cosas con nil para ver si estan vacias. Nil significa que apunta
#a nulo, no que el contenedor este vacio: por ejemeplo en hasVisibleTreasures
class Player
  attr_reader :dead
  attr_reader :name
  attr_reader :level
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
    if(@visibleTreasures==nil&& @hiddenTreasures==nil)
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
    total_level
    collar = false
    
    if (@visibleTreasures.size != 0)
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
      
      total_level += @level 
      
    else
      total_level = @level
    end
    total_level
  end
  
  def validState
    if(@pendingBadConsequence==nil && @hiddenTreasures.size<=4)
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
    if(@visibleTreasures==nil)
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