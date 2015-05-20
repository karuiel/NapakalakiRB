# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class CultistPlayer < Player
    @@totalCultistPlayers = 0
    
    def initialize(p,c)
      super(p)
      @@totalCultistPlayers += 1 
      @myCultistCard = Array.new
      @myCultistCard << c
    end
   
   # def newPlayer(player)
   #   super
   #   @@totalCultistPlayers += 1
   # end

    
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
      super + @myCultistCard.at(0).getSpecialValue
    end
    
    def computeGoldCoinsValue(t)
      super * 2
    end
    
    protected :computeGoldCoinsValue
   # protected :getOponentLevel
    protected :shouldConvert
    
  end
end
