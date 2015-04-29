#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'
require_relative "prize.rb"
require_relative "bad_consequence.rb"
require_relative "monster.rb"
require_relative "treasure_kind.rb"
require_relative "dice.rb"
require_relative "player.rb"
require_relative "card_dealer.rb"
require_relative "combat_result.rb"
require_relative "treasure.rb"

module Model
  class Napakalaki
    include Singleton
    attr_reader :currentPlayer
    attr_reader :currentMonster
    attr_reader :visibleTreasures
    attr_reader :hiddenTreasures


    def initialize
      @currentPlayerIndex = -1;
      #@currentPlayer
      #@currentMonster
      #@players = Array.new

    end
    
      def getCurrentPlayer
        @currentPlayer
      end
    
      def getCurrentMonster
        @currentMonster
      end
      
      def getVisibleTreasures
        @visibleTreasures
      end
      
      def getHiddenTreasures
        @hiddenTreasures
      end
      
      def initPlayers(names)
        @players = Array.new
        names.each{|x| 
           @players << Player.new(x)
        }
      
      end

      def nextPlayer
        
        if(@currentPlayerIndex == -1)
          @currentPlayerIndex = rand(@players.size)

        else
          @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.size 
        end 
        
        @currentPlayer = @players.at(@currentPlayerIndex)
        @currentPlayer

      end

      def combat
        result = @currentPlayer.combat(@currentMonster);
        dealer = CardDealer.instance;
        dealer.giveMonsterBack(@currentMonster);
        return result;
      end

      def discardVisibleTreasure(t)
        @currentPlayer.discardVisibleTreasure(t)
      end

      def discardHiddenTreasure(t)
        @currentPlayer.discardVisibleTreasure(t) 
      end

      def makeTreasureVisible(t)

      end

      def buyLevels(visible, hidden)
        return @currentPlayer.buyLevels(visible, hidden)
      end

      def initGame(players)
        dealer = CardDealer.instance
        dealer.initCards
        initPlayers(players)
        nextTurn()
      end
      
      def getCurrentPlayer
        @currentPlayer
      end
      
      def getCurrentMonster
        @currentMonster
      end

      def canMakeTreasureVisible(t)

        canMake = @currentPlayer.canMakeTreasureVisible(t)
        
        if(canMake)
            @currentPlayer.makeTreasureVisible(t)
        end
         canMake;
      end

      def  nextTurn
        allowed = nextTurnAllowed()
        if(allowed)
            dealer = CardDealer.instance
            @currentMonster = dealer.nextMonster
            @currentPlayer = nextPlayer()
            if(@currentPlayer.isDead)
                @currentPlayer.initTreasures() 
            end
        end    
        allowed;
      end
      
      def  nextTurnAllowed
          if(@currentPlayerIndex==-1)
            allowed = true;
          else
            allowed = @currentPlayer.validState
          end
          allowed
      end

      def endOfGame(result)
        result == CombatResult::WINANDWINGAME
      end

    private :initPlayers
    private :nextPlayer
 
  end 
     
end

  