#!/usr/bin/env ruby
#encoding: utf-8
#
#=monster.rb
#
#Author:: Miguel Morales Castillo y María del Mar Ruiz Martín
#
#==Clase Monster
#Con esta clase podemos definir a un monstruo correctamente el cual esta compuesto
#por el nombre reflejado en la variable _name_, un nivel de combate reflejado en
#el atributo _combatLevel_, un premio por vencerlo reflejado en el atributo _price_
#objeto de la clase _Prize_ y por un mal rollo ofrecido por el atributo _bc_ de
#la clase _BadConsequence_
#
#La clase _Monster_ esta compuesta por:
#
## método initialize
#Este método permite inicializar un objeto de la clase _Monster_, inicializa los
#atributos mencionados en la descripción de la clase
#
## getters de los atributos
## método to_s
#
#En este método se devuelve un string con el estado completo del objeto
#
#

#require_relative "bad_consequence.rb"
#require_relative "prize.rb"

module Model
require_relative "card"
  
  class Monster
    
    attr_reader :name
    attr_reader :combatLevel
    attr_reader :price
    attr_reader :bc

    ##
     #  Constructor con parámetros
     #  String name: nombre del monstruo
     #  int level: nivel de combate del monstruo
     #  BadConsequence bc: mal rollo del monstrup
     #  Prize price: buen rollo del monstruo
     # 
    def initialize(aName, someCombatLevel, aBC, aPrice,lC)
      @name = aName

      if someCombatLevel > 0
        @combatLevel = someCombatLevel
      else
        @combatLevel = 0
      end  

      @price = aPrice
      @bc = aBC   
      @levelChangeAgainstCultistPlayer = lC
    end

    def to_s
      "\nName: #{@name}\nCombatLevel: #{@combatLevel}\n Price: #{@price.to_s}"+
        "\nBadConsequence: #{@bc.to_s}"
    end
    
    ##
     # Método para obtener el atributo name
     # devuelve  String: nombre del monstruo
     # 
    def getName
      @name
    end
    
    ##
     #  Método para obtener el atributo combatLevel
     # devuelve  int: nivel de combate del monstruo
     # 
    def getLevel
      @combatLevel
    end
    
    ##
     # Método para obtener el atributo price
     # devuelve  Prize: buen rollo del monstruo
     # 
    def getPrize
      @price
    end
    
     ##
     #  Método para obtener el atributo bc
     # devuelve  BadConsequence: mal rollo del monstruo
     #
    def getBadConsequence
      @bc
    end
    
    def getBasicValue
      getLevel
    end
    
    def getSpecialValue
      getLevel + @levelChangeAgainstCultistPlayer
    end
    
  end

end