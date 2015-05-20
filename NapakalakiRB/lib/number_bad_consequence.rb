# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Model
class NumberBadConsequence < BadConsequence
  public_class_method :new
  attr_reader :nHiddenTreasures
  attr_reader :nVisibleTreasures
  attr_reader :levels
  
  def initialize(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    super(aText)
    if someLevels > 0
     @levels = someLevels
    else
      @levels = 0
    end
      
    if someVisibleTreasures > 0
        @nVisibleTreasures = someVisibleTreasures
    else 
        @nVisibleTreasures = 0
    end

    if someHiddenTreasures  > 0
        @nHiddenTreasures = someHiddenTreasures
    else 
        @nHiddenTreasures = 0
    end

  end
  
     ##
   #  Metodo que devuelve el atributo texto
   # devuelve  String: cadena de texto 
   # 
    def getText
      @text
    end
    
    ##
   #  Metodo que devuelve el atributo levels
   # devuelve  int: número de niveles a perder 
   # 
    def getLevels
      @levels
    end
    
    ##
   #  Metodo que devuelve el atributo nVisibleTreasures
   # devuelve  int: número de tesoros visibles a perder 
   #
    def getNVisibleTreasures
      @nVisibleTreasures
    end
    
   ##
   #  Metodo que devuelve el atributo nHiddenTreasures
   # devuelve  int: número de tesoros invisibles a perder
   #  
    def getNHiddenTreasures
      @nHiddenTreasures
    end    
    
  def isEmpty
    empty = false
    if(@nVisibleTreasures==0 && @nHiddenTreasures==0)
      empty =  true
    end
    
    empty
  end  
  
    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        visibles, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractVisibleTreasure(t)     

         @nVisibleTreasures = [0,(@nVisibleTreasures-1)].max 

    end

    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        ocultos, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractHiddenTreasure(t)

         @nHiddenTreasures = [0,@nHiddenTreasures-1].max 

    end
   ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
       
          if(@nVisibleTreasures < v.size())
            nV =@nVisibleTreasures 
          else
            nV = v.size()
          end 
          
          if(@nHiddenTreasures < h.size())
            nH = @nHiddenTreasures 
          else
            nH = h.size()
          end
          
          bad = NumberBadConsequence.new(@text, 0, nV, nH)      
          bad
  
  end
  
  
  
  def to_s
    out = super
    out += "Esto es un mal rollo con el siguiente contenido: " + 
      "\n texto : #{@text}"  + "\nLevels: #{@levels}\nnVisibleTreasures: #{@nVisibleTreasures}\n"+
      "nHiddenTreasures: #{@nHiddenTreasures}"
  out
  end
  
  
end
end
