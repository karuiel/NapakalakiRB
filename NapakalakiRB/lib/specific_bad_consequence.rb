# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Model
class SpecificBadConsequence
  public_class_method :new
  attr_reader :specificHiddenTreasures
  attr_reader :specificVisibleTreasures
  attr_reader :levels
  def initialize(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    super(aText)
    if someLevels > 0
        @levels = someLevels
      else
        @levels = 0
      end
      
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
  end
  
  def isEmpty
    valid = false
    if(@levels == 0 && @specificVisibleTreasures.size==0  && @specificHiddenTreasures.size==0)
      valid =  true
    end
    valid
  end
  
    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        visibles, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractVisibleTreasure(t)

      found = false
      i = 0
      indice = 0
      if @specificVisibleTreasures.size != 0
         @specificVisibleTreasures.each{|x|
            if !found && x == t.type
                indice = i
                found = true
            end
            i+=1
        }
        if found
          @specificVisibleTreasures.delete_at(indice)      
        end 
      end  
    end

    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        ocultos, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractHiddenTreasure(t)
     
      found = false
      i = 0
      indice = 0
      if @specificHiddenTreasures.size !=0
         @specificHiddenTreasures.each{|x|
            if !found && x == t.type
                indice = i
                found = true
            end
            i+=1
        }
        if found
          @specificHiddenTreasures.delete_at(indice)  
          
        end 
      end  
 
    end
    
    
     ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
      
        vT = Array.new
        hT = Array.new
        vCopy = Array.new
        hCopy = Array.new
        v.each{|t|
          vCopy << t
        }
        h.each{|t|
          hCopy << t
        }  
        
        @specificVisibleTreasures.each{|t1|
            found = false
            vCopy.each{|t2|
                type = t2.getType
                if(type == t1 && !found)
                    vT << t1
                    vCopy.delete(t2)
                    found = true
                end
            }
          }
       
        @specificHiddenTreasures.each{|t1|            
            found = false
            hCopy.each{|t2|
                type = t2.getType
                if(type == t1 && !found)
                    hT << t1
                    hCopy.delete(t2)
                    found = true
                end
            }
        }
        bad  = SpecificBadConsequence.new(@text ,0, vT, hT)
  
        bad
  
    end
  
  
  def to_s
    out= "Esto es un mal rollo con el siguiente contenido: " + 
      "\n texto : #{@text}"  + "\nLevels: #{@levels}" + "\nSpecificVisibleTreasure: "
      if(@specificVisibleTreasures.size != 0)
        @specificVisibleTreasures.each {|x|
          out += x.to_s
          out += " "}
      else 
        out += "nil"
      end
      
      out += "\nSpecificHiddenTreasures: "
      if (@specificHiddenTreasures.size != 0)
        @specificHiddenTreasures.each {|x| 
          out += x.to_s 
          out += " "

        }
      else
        out += "nil"
      end  
  out
  end
  
  ##
  #  Metodo que devuelve el atributo specificHiddenTreasures 
  # devuelve  ArrayList<TreasureKind>: Array con el tipo de tesoros invisibles 
  #                                   concretos que se pierden
  #                                   Será un array vacío en caso de que no se especifiquen      
  # 

  def getSpecificHiddenTreasures
    @specificHiddenTreasures
  end
    
  ##
  #  Metodo que devuelve el atributo specificHiddenTreasures 
  # devuelve  ArrayList<TreasureKind>: Array con el tipo de tesoros visibles 
  #                                  concretos que se pierden
  #                                   Será un array vacío en caso de que no se especifiquen      
  #
  def getSpecificVisibleTreasures
    @specificVisibleTreasures
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
end
end