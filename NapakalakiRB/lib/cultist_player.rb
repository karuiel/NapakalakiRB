# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class CultistPlayer < Player
    @@totalCultistPlayers = 0
    
    def initialize(p,c)
      newPlayer(p)
      @@totalCultistPlayers += 1 
      @myCultistCard = c
    end
    
    def self.getTotalCultistPlayer()
        @@totalCultistPlayers
    end
    
    def shouldConvert
      false
    end
    
    def getOponentLevel(m)
      m.getSpecialValue()
    end
    
    def getCombatLevel
      super + @myCultistCard.getSpecialValue
    end
    
    def computeGoldCoinsValue(t)
      super * 2
    end
    
    def to_s
        output = super
        output += "\n\tmyCultistCard = " + @myCultistCard.to_s
        output
    end
    
    protected :computeGoldCoinsValue
   # protected :getOponentLevel
    protected :shouldConvert
    
  end
end
