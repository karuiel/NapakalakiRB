#!/usr/bin/env ruby
#encoding: utf-8

#require_relative "treasure_kind.rb"
module Model
  class Treasure
        attr_reader :name
        attr_reader :goldCoins;
        attr_reader :minBonus;
        attr_reader :maxBonus;
        attr_reader :type;

      def initialize (n, g, min, max, t)
        @name = n
        @goldCoins = g
        @minBonus = min
        @minbonus = max
        @type = t
      end
      
      def getName
        @name
      end
      
      def getGoldCoins
        @goldCoins
      end
      
      def getMinBonus
        @minBonus
      end
      
      def getMaxBonus
        @maxBonus
      end
      
      def getType
        @type
      end
      
      def to_s
        output ="Nombre = " + @name + 
              "\nTipo = "+ @type +
              "\nValor = " +Integer.toString(@goldCoins) +
              "\nMin Bonus = " + Integer.toString(@minBonus)+
              "\nMax Bonus= " + Integer.toString(@maxBonus);
        
        output
            
      end
    end
end