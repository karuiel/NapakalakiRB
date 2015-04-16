#!/usr/bin/env ruby
#encoding: utf-8

require_relative "player.rb"
require 'singleton'
require_relative "combat_result.rb"

module Model
  class Napakalaki
    include Singleton
    attr_reader :currentPlayer
    attr_reader :currentMonster
    attr_reader :visibleTreasures
    attr_reader :hiddenTreasures


    def initialize
      #@currentPlayer
      #@currentMonster
      #@players = Array.new

    end
      def initPlayers(names)
        @players = Array.new
        names.each{|x| 
           @players << Player.new(x)
        }
      
      end

      def nextPlayer
        @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.size 
        @currentPlayer = @players.at(@currentPlayerIndex)
        @currentPlayer

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
          @currentPlayer.validState
      end

      def endOfGame(result)
        result == CombatResult::WINANDWINGAME
      end

    private :initPlayers
    private :nextPlayer
 
  end 
     
end

  