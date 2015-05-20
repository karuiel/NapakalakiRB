#!/usr/bin/env ruby
#encoding: utf-8
##
 # Clase que representa los tesoros
 # Invariante de representación:
 #  -El atributo goldCoins debe ser un entero no negativo
 #  -El atributo minBonus debe ser un entero no negativo
 #  -El atributo maxBonus debe ser un entero no negativo
 #
#require_relative "treasure_kind.rb"
module Model
require_relative 'Card'  
  
  class Treasure
    
    include Card
    
        attr_reader :name
        attr_reader :goldCoins;
        attr_reader :minBonus;
        attr_reader :maxBonus;
        attr_reader :type;

        ##
     #  constructor de la clase
     #  String n: nombre del tesoro
     #  int g: número de monedas de oro
     #  int min: número mínimo de niveles
     #  int max: número máximo de niveles
     #  TreasureKind t: tipo de tesoro
    #
      def initialize (n, g, min, max, t)
        @name = n
        @goldCoins = g
        @minBonus = min
        @maxBonus = max
        @type = t
      end
      
     ##
     #  Método para obtener el nombre del tesoro
     #  String: nombre del tesoro
    #
      def getName
        @name
      end
     ##
     #  Método para obtener el número de monedas de oro asociado
     #  int: número de monedas
    #
      def getGoldCoins
        @goldCoins
      end
      
          ##
     #  Método para obtener el número mínimo de niveles
     #  int: número mínimo de niveles
    #
      def getMinBonus
        @minBonus
      end
      
     ##
     #  Método para obtener el número máximo de niveles
     #  int: número máximo de niveles
    #
      def getMaxBonus
        @maxBonus
      end
      
      ##
     #  Método para obtener el tipo al que pertenece el tesoro
     #  TreasureKind: tipo del tesoro
    #
      def getType
        @type
      end
      
      ##
     #  Método que convierte a String un elemento Treasure
     # devuelve  String: cadena de texto obtenida
    #
      def to_s
        output ="Nombre = #{@name}" +  
              "\nTipo = #{@type}" +
              "\nValor = #{@goldCoins}"  +
              "\nMin Bonus = #{@minBonus}" + 
              "\nMax Bonus= #{@maxBonus}" 
        
        output
            
      end
      
      def getBasicValue
        getMinBonus
      end
      
      def getSpecialValue
        getMaxBonus
      end
      
    end
end