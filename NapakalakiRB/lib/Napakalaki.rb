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

    ##
    #   Constructor de la Clase
    #
    def initialize
      @currentPlayerIndex = -1;


    end
    ##
    #   getter de currentPlayer
    #
      def getCurrentPlayer
        @currentPlayer
      end
    ##
    #   getter de currentMonster
    #
      def getCurrentMonster
        @currentMonster
      end
    ##
    #   getter de visibleTreasures
    #
      def getVisibleTreasures
        @visibleTreasures
      end
    ##
    #   getter de hiddenTreasures
    #
      def getHiddenTreasures
        @hiddenTreasures
      end
      
      ##
     #  Método encargado de inicializar la lista de jugadores
     #  ArrayList<String> names: nombre de los jugadores
    #
      def initPlayers(names)
        @players = Array.new
        names.each{|x| 
           @players << Player.new(x)
        }
      
      end
      
      ##
     #  Método encargado de determinar cuál es el siguiente jugador
     #  devuelve Player: jugador siguiente
    #
      def nextPlayer
        
        if(@currentPlayerIndex == -1)
          @currentPlayerIndex = rand(@players.size)

        else
          @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.size 
        end 
        
        @currentPlayer = @players.at(@currentPlayerIndex)
        @currentPlayer

      end

      ##
     #  Método para combatir contra un monstruo
     #  devuelve CombatResult: resultado del combate
    #
      
      def combat
        result = @currentPlayer.combat(@currentMonster)
        dealer = CardDealer.instance
        
        if(result == CombatResult::LOSEANDCONVERT)
          
            c = dealer.nextCultist()
            cp = CultistPlayer.new(@currentPlayer,c)
            @currentPlayer = cp
            @players.set(@currentPlayerIndex, cp)
        end
        
        dealer.giveMonsterBack(@currentMonster)
        return result
      end

     ##
     #  Método encargado de descartar una carta de tesoro visible de un jugador
     #  Treasure t: carta a descartar
    #
      def discardVisibleTreasure(t)
        @currentPlayer.discardVisibleTreasure(t)
      end
      
     ##
     #  Método encargado de descartar una carta de tesoro visible de un jugador
     #  Treasure t: carta a descartar
    #
      def discardHiddenTreasure(t)
        @currentPlayer.discardVisibleTreasure(t) 
      end
      
      
      def makeTreasureVisible(t)
        
          @currentPlayer.makeTreasureVisible(t)
        
      end
      
      ##
     #  Método que gestiona la compra de niveles
     #  ArrayList<Treasure> visible: lista de tesoros visibles del jugador
     #  ArrayList<Treasure> hidden: lista de tesoros ocultos del jugador
     #  devuelve boolean: true en caso de que se lleve a cabo la compra
     #                   false en caso contrario
    #
      def buyLevels(visible, hidden)
        return @currentPlayer.buyLevels(visible, hidden)
      end
      
     ##
     #  Método encargado de iniciar el juego
     #  ArrayList<String> players: nombre de los jugadores
    #
      def initGame(players)
        dealer = CardDealer.instance
        dealer.initCards
        initPlayers(players)
        nextTurn()
      end
      
     ##
     #  Consultor de CurrentPlayer
     #  devuelve Player: currentPlayer
    #      
      def getCurrentPlayer
        @currentPlayer
      end
      
     ##
     #  Consultor de CurrentMonster
     #  devuelve Monster: currentMonster
    #
      def getCurrentMonster
        @currentMonster
      end
      
    ##
     #  Método que comprueba si un tesoro oculto puede pasar a ser visible
     #  Treasure t: tesoro que se quiere hacer visible
     #  devuelve boolean: true en caso en que se pueda hacer visible
      #                  false en caso contrario
    #
      def canMakeTreasureVisible(t)

        @currentPlayer.canMakeTreasureVisible(t)
        
      end

      ##
     #  Método para pasar de turno
     #  devuelve boolean: true en caso en que se haya pasado de turno correctamente
     #                  false en caso contrario
    #
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
      
      
      ##
     #  Método que comprueba si se puede pasar de turno
     #  devuelve boolean: true en caso en que se pueda pasar de turno
     #                   false en caso contrario
    #
      def  nextTurnAllowed
          if(@currentPlayerIndex==-1)
            allowed = true;
          else
            allowed = @currentPlayer.validState
          end
          allowed
      end

      ##
     #  Método que determina si el juego ha terminado
     #  devuelve boolean: true en caso en que haya terminado el juego
     #                  false en caso contrario
    #
      def endOfGame(result)
        result == CombatResult::WINANDWINGAME
      end

    private :initPlayers
    private :nextPlayer
 
  end 
     
end

  