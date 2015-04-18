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
    attr_reader :levels
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificHiddenTreasures
    attr_reader :specificVisibleTreasures

    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
                    someSpecificVisibleTreasures, someSpecificHiddenTreasures, newDeath)
      @text = aText
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

      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
      @death = newDeath

    end

    ##
   # Constructor con parámetros
   # String t: cadena de texto
   # int l: número de niveles a perder
   # int nVisible: número de tesoros visibles a perder
   # int nHidden: número de tesoros ocultos a perder
   #
    def BadConsequence.newNumberOfTreasures(t, l, nVisible, nHidden)
      new(t, l, nVisible, nHidden, Array.new, Array.new, false)  
    end

   ##
   #  Constructor con parámetros
   #  String t: cadena de texto
   #  int l: número de niveles a perder
   # ArrayList<TreasureKind> v: array con los tesoros visibles
   #  ArrayList<TrasureKind> h: array con los tesoros ocultos
   #
    def BadConsequence.newSpecificTreasures (t, l, v,h)
      new(t, l, 0, 0, v, h, false)

    end                                       

    ##
   # Constructor con parámetros
   # String t: cadena de texto
   # boolean death: muerte
   #
    def BadConsequence.newDeath (t,death)

      new(t, 0, 0, 0, Array.new, Array.new, death)

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
   #  Método para convertir en cadena de texto los atributos del objeto
   # devuelve  String: cadena de texto con el valor de los atributos
   #
    def to_s
      out="Text: #{@text}\nLevels: #{@levels}\nnVisibleTreasures: #{@nVisibleTreasures}\n"+
      "nHiddenTreasures: #{@nHiddenTreasures}\nDeath: #{@death}\nSpecificVisibleTreasure: "
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
   #  Método para comprobar si el mal rollo está vacío
   # devuelve  boolean: true en caso de que esté vacío
   #                  false en caso contrario
   #
    def isEmpty
      valid = false
      if(@levels == 0 && @nVisibleTreasures==0 && @nHiddenTreasures==0 && @death==false &&
                      @specificVisibleTreasures.size==0  && @specificHiddenTreasures.size==0)
        valid =  true
      end
      valid
    end

    ##
   #  Método para determinar si el mal rollo implica la muerte
   # devuelve  boolean: truen en caso de que implique la muerte
   #                   false en caso contrario
  #
    def kills
      @death
    end

    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        visibles, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractVisibleTreasure(t)
      eliminado = false 
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
          eliminado = true
        end 
      end  
      if !eliminado
         @nVisibleTreasures = [0,(@nVisibleTreasures-1)].max 
      end
    end

    ##
   #  Método para eliminar un tesoro t de la lista de tesoros
   #        ocultos, ya sea específico o un número determinado
   #  Treasure t: tesoro entregado para cumplir el mal rollo
  #
    def substractHiddenTreasure(t)
      eliminado = false
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
          eliminado = true
        end 
      end  
      if !eliminado
         @nHiddenTreasures = [0,@nHiddenTreasures-1].max 
      end
    end
    
    ##
   #  Método para crear un mal rollo de forma que el jugador lo pueda cumplir
   #  ArrayList<Treasure> v: lista de tesoros visibles que posee el jugador
   #  ArrayList<Treasure> h: lista de tesoros ocultos que posee el jugador
   # devuelve  BadConsequence: mal rollo creado
  #
    def adjustToFitTreasureLists(v,h)
       
      if(@death)
         bad = newDeath(@text,@death) 
      
      elsif(@nVisibleTreasures != 0 || @nHiddenTreasures != 0)
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
          
          bad = BadConsequence.newNumberOfTreasures(@text, 0, nV, nH)
          
      else
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
        bad  = BadConsequence.newSpecificTreasures(@text ,0, vT, hT)
      end
      return bad;
  
    end
  end

end