#encoding: utf-8
##
 # Clase que representa un buen rollo
 # Invariante de representación:
 #  -El atributo treasures debe ser un entero no negativo
 #  -El atributo levels debe ser un entero no negativo
 #
module Model
  class Prize

    attr_reader :treasures, :levels

     ##
     # Constructor de la clase
     # int treasures: número de tesoros
     # inr levels: número de niveles
     #
    def initialize(t,l)
      if t > 0
        @treasures = t
      else 
        @treasures = 0
      end

      if l > 0
        @levels = l
      else 
        @levels = 0
      end  
    end

     ##
     # Método que convierte en cadena de texto los atributos del objeto 
     #@retun String cadena con los valores de los atributos
     #
    def to_s
      "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@levels}"
    end
  end
  
      ##
     # Método que devuelve el valor del atributo treasures
     #devuelve  int número de tesoros
     #
  def getTreasures
    @treasures
  end
  
      ##
     # Método que devuelve el valor del atributo levels
     #devuelve  int número de niveles
     #
  def getLevels
    @levels
  end
end