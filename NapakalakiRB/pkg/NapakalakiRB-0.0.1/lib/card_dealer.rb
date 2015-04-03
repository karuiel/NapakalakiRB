# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class CardDealer
  include Singleton
    private_class_method :initTreasureCardDeck
    private_class_method :initMonsterCardDeck
    private_class_method :shuffleTreasures
    private_class_method :shuffleMonsters
    
  def initialize
 
    @unusedMonster = Array.new
    @usedMonster = Array.new 
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
  end  
    

    def initTreasureCardDeck
    end 

    def initMonsterCardDeck
    end

    def shuffleTreasures
    end

    def shuffleMonsters
    end

    def nextTreasure
    end
    
    def nextMonster
    end
    
    def giveTreasureBack(t)
    end
    
    def giveMonsterBack(m)
    end
    
    def initCards
    end


end
