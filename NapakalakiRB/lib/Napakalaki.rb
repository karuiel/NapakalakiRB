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

    /*
      @brief Constructor de la Clase
    */
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
      
      /*
     * @brief Método encargado de inicializar la lista de jugadores
     * @param ArrayList<String> names: nombre de los jugadores
    */
      def initPlayers(names)
        @players = Array.new
        names.each{|x| 
           @players << Player.new(x)
        }
      
      end
      
      /*
     * @brief Método encargado de determinar cuál es el siguiente jugador
     * @return Player: jugador siguiente
    */
      def nextPlayer
        
        if(@currentPlayerIndex == -1)
          @currentPlayerIndex = rand(@players.size)

        else
          @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.size 
        end 
        
        @currentPlayer = @players.at(@currentPlayerIndex)
        @currentPlayer

      end

      /*
     * @brief Método para combatir contra un monstruo
     * @return CombatResult: resultado del combate
    */
      
      def combat
        result = @currentPlayer.combat(@currentMonster);
        dealer = CardDealer.instance;
        dealer.giveMonsterBack(@currentMonster);
        return result;
      end

     /*
     * @brief Método encargado de descartar una carta de tesoro visible de un jugador
     * @param Treasure t: carta a descartar
    */
      def discardVisibleTreasure(t)
        @currentPlayer.discardVisibleTreasure(t)
      end
      
     /*
     * @brief Método encargado de descartar una carta de tesoro visible de un jugador
     * @param Treasure t: carta a descartar
    */
      def discardHiddenTreasure(t)
        @currentPlayer.discardVisibleTreasure(t) 
      end
      
      
      def makeTreasureVisible(t)
        
          @currentPlayer.makeTreasureVisible(t)
        
      end
      
      /*
     * @brief Método que gestiona la compra de niveles
     * @param ArrayList<Treasure> visible: lista de tesoros visibles del jugador
     * @param ArrayList<Treasure> hidden: lista de tesoros ocultos del jugador
     * @return boolean: true en caso de que se lleve a cabo la compra
                        false en caso contrario
    */
      def buyLevels(visible, hidden)
        return @currentPlayer.buyLevels(visible, hidden)
      end
      
     /*
     * @brief Método encargado de iniciar el juego
     * @param ArrayList<String> players: nombre de los jugadores
    */
      def initGame(players)
        dealer = CardDealer.instance
        dealer.initCards
        initPlayers(players)
        nextTurn()
      end
      
     /*
     * @brief Consultor de CurrentPlayer
     * @return Player: currentPlayer
    */      
      def getCurrentPlayer
        @currentPlayer
      end
      
     /*
     * @brief Consultor de CurrentMonster
     * @return Player: currentMonster
    */
      def getCurrentMonster
        @currentMonster
      end
      
      def canMakeTreasureVisible(t)

        @currentPlayer.canMakeTreasureVisible(t)
        
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

  