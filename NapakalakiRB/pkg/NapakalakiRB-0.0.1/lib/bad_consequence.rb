#!/usr/bin/env ruby
#encoding: utf-8
#
#=bad_consequence.rb
#
#Author:: Miguel Morales Castillo y María del Mar Ruiz Martín
#
#== Clase BadConsequence
#En esta clase se recoge lo relativo a los malos rollos de los monstruos, indica
#que tesoros se pierden tanto visibles como ocultos asi como la pérdida de niveles
#e incluso la muerte.
#
#La clase _BadConsequence_ consta de:
## método initialize
# En este método se inicializa un objeto válido de la clase que tiene los siguientes
# atributos:
# - tex: texto con el mal rollo
# - levels: niveles que pierdes
# - nVisibleTreasures: número de tesoros visibles que pierdes
# - nHiddenTreasures: número de tesoros ocultos que pierdes
# - death: variable _boolean_ que indica si estas muerto o no
# - specificHiddenTreasures: array con los tesoros específicos ocultos que pierdes
# - specificVisibleTreasures: array con los tesoros específicos visibles que pierdes
#
## getters de todos los atributos
## constructor newNumberOfTreasures
#
#En este constructor pasas como parámetro el texto, los niveles, y el número de
#tesoros visibles y ocultos que pierdes
#
## constructor newSpecificTreasures
#
#En este constructor pasas como parámetro el texto, los niveles y los arrays
#correspondientes a los tesoros específicos visibles y ocultos
#
## constructor newDeath
#
#En este constructor pasas como parametro solo el texto se usa para poner la veriable
#_death_ a true
#
## método to_s
#
#En este método se devuelve un string con el estado completo del objeto
#

#require_relative "treasure_kind.rb"
module Model
  class BadConsequence

    
    private_class_method :new
    attr_reader :text
    

    def initialize(aText)
      @text = aText 
    end
   
    def getLevels
      0
    end

    ##
   #  Método para convertir en cadena de texto los atributos del objeto
   # devuelve  String: cadena de texto con el valor de los atributos
   #
    def to_s
    end

    ##
   #  Método para comprobar si el mal rollo está vacío
   # devuelve  boolean: true en caso de que esté vacío
   #                  false en caso contrario
   #
   
    def isEmpty

    end

     ##
   #  Metodo que devuelve el atributo texto
   # devuelve  String: cadena de texto 
   # 
    def getText
    end
  
    ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
    end

  end
end
