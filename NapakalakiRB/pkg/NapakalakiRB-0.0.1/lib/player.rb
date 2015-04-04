# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#NOTA: revisar el initialize a ver si esta bien. reader de level¿?(creo que no)
#preguntar lo del collar.
class Player
  attr_reader :dead
  attr_reader :name
  attr_reader :level
  #attr_reader :MAXHIDDENTREASURES = 4
  attr_reader :hiddenTreasures
  attr_reader :visibleTreasures
  
  
  private_class_method :bringtoLive
  private_class_method :icrementLevels
  private_class_method :decrementLevels
  private_class_method :setPendingBadConsequence
  private_class_method :die
  private_class_method :discardNecklaceIfVisible
  private_class_method :dieIfNoTreasures
  private_class_method :canIBuyLevels
  protected_class_method :computeGoldCoinsValue
  
  
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
      dead=true
    end
  end  
  
  def canIBuyLevlels(l)
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
      @visibleTreasures.each{|x|
        if(x.type == TreasureKind::NECKLACE)
          collar=true
        end
      }
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

end