# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  attr_reader :dead
  attr_reader :name
  attr_reader :level
  #attr_reader :MAXHIDDENTREASURES = 4
  attr_reader :hiddenTreasures
  attr_reader :visibleTreasures
  attr_reader :pendingBadConsequence
  
  private_class_method :bringtoLive
  private_class_method :icrementLevels
  private_class_method :decrementLevels
  private_class_method :setPendingBadConsequence
  private_class_method :die
  private_class_method :discardNecklaceIfVisible
  private_class_method :dieIfNoTreasures
  private_class_method :canIBuyLevels
  protected_class_method :computeGoldCoinsValue
  
  
  def initialize
    
  end
 
  def bringToLive  
  end  
  
  def incrementLevels(l)
  end  
  
  def  decrementLevels(l)
  end  
  
   
  def setPendingBadConsequence(b)
  end  
  
  def die
  end
  
  def discardNecklaceIfVisible
  end
  
  def dieIfNoTreasures
  end  
  
  def canIBuyLevlels(l)
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
    
  def validState()
  end
  
  def  initTreasures
  end  
  
  def isDead
  end
  
  def hasVisibleTreasures
  end

end