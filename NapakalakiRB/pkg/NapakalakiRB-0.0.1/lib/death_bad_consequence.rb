# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model

class DeathBadConsequence < BadConsequence
public_class_method :new
attr_reader :death
  def initialize(aText,newDeath)
    super(aText)
    @death=newDeath
  end
  def kills
    @death
  end
       ##
   #  Metodo que devuelve el atributo texto
   # devuelve  String: cadena de texto 
   # 
    def getText
      @text
    end
  

 ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
       
         bad = DeathBadConsequence.new(@text,@death)      
         bad
  
    end   

  def isEmpty
    if @death==false
      true
    else
      false
    end    
  end
  
  def to_s
    output = super
    output += "\n death = #{@death}"
    output
  end

end
end