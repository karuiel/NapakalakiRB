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
      output = "\nEsto es un mal rollo con el siguiente contenido:\n"
      output +="Text = #{@text}"
      output
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
      @text
    end
  
    def substractVisibleTreasure(treasure)
    end
    
    def substractHiddenTreasure(treasure)
    end
    
    ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
    end
    
    def kills
      false
    end

  end
end
