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
#* método initialize
#Este método permite inicializar un objeto de la clase _Monster_, inicializa los
#atributos mencionados en la descripción de la clase
#
#* getters de los atributos
#* método to_s
#
#En este método se devuelve un string con el estado completo del objeto
#
#

#require_relative "bad_consequence.rb"
#require_relative "prize.rb"

module Model

  class Monster
    attr_reader :name
    attr_reader :combatLevel
    attr_reader :price
    attr_reader :bc

    def initialize(aName, someCombatLevel, aBC, aPrice)
      @name = aName

      if someCombatLevel > 0
        @combatLevel = someCombatLevel
      else
        @combatLevel = 0
      end  

      @price = aPrice
      @bc = aBC    
    end

    def to_s
      "\nName: #{@name}\nCombatLevel: #{@combatLevel}\n Price: #{@price.to_s}"+
        "\nBadConsequence: #{@bc.to_s}"
    end
    
    def getName
      @name
    end
    
    def getCombatLevel
      @combatLevel
    end
    
    def getPrize
      @price
    end
    
    def getBadConsequence
      @bc
    end
    
  end

end