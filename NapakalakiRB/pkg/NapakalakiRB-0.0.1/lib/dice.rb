#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'

##
 # Clase que representa un dado
 # Invariante de representación:
 #  -Tan solo puede haber una instancia de la clase
 #
module Model
  class Dice
   
    include Singleton
    
     ##
     #  Constructor de la clase
     #
    
    def initialize
      
    end
    
     ##
     #  Método para obtener un número
     # devuelve  int: número obtenido
     #
    def nextNumber
      1 + rand(6)
    end
  end
end
