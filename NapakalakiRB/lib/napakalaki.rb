#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'
class Napakalaki
  include Singleton
  attr_reader :currentPlayer
  attr_reader :currentMonster
  attr_reader :visibleTreasures
  attr_reader :hiddenTreasures
  private_class_method :initPlayers
  private_class_method :nextPlayer
  
  def initialize
    #@currentPlayer
    #@currentMonster
    #@players = Array.new
    
  end
    def initPlayers(names)
      
    end
    
    def nextPlayer
      
    end
    
    def combat
      
    end
    
    def discardVisibleTreasure(t)
      
    end
    
    def discardHiddenTreasure(t)
      
    end
    
    def makeTreasureVisible(t)
      
    end
    
    def buyLevels(visible, hidden)
      
    end
    
    def initGame(players)
      
    end

    def canMakeTreasureVisible(t)
      
    end
    
    def  nextTurn
      
    end
    def  nextTurnAllowed
    
    end
    
    def endOfGame(result)
      
    end
  
end
