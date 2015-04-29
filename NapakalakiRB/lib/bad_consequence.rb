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
#* método initialize
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
#* getters de todos los atributos
#* constructor newNumberOfTreasures
#
#En este constructor pasas como parámetro el texto, los niveles, y el número de
#tesoros visibles y ocultos que pierdes
#
#* constructor newSpecificTreasures
#
#En este constructor pasas como parámetro el texto, los niveles y los arrays
#correspondientes a los tesoros específicos visibles y ocultos
#
#* constructor newDeath
#
#En este constructor pasas como parametro solo el texto se usa para poner la veriable
#_death_ a true
#
#* método to_s
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

    def BadConsequence.newNumberOfTreasures(t, l, nVisible, nHidden)
      new(t, l, nVisible, nHidden, Array.new, Array.new, false)  
    end

    def BadConsequence.newSpecificTreasures (t, l, v,h)
      new(t, l, 0, 0, v, h, false)

    end                                       

    def BadConsequence.newDeath (t,death)

      new(t, 0, 0, 0, Array.new, Array.new, death)

    end

    def getText
      @text
    end
    
    def getLevels
      @levels
    end
    
    def getNVisibleTreasures
      @nVisibleTreasures
    end
    
    def getNHiddenTreasures
      @nHiddenTreasures
    end    
    
    def getSpecificHiddenTreasures
      @specificHiddenTreasures
    end
    
    def getSpecificVisibleTreasures
      @specificVisibleTreasures
    end
    
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

    def isEmpty
      valid = false
      if(@levels == 0 && @nVisibleTreasures==0 && @nHiddenTreasures==0 && @death==false &&
                      @specificVisibleTreasures.size==0  && @specificHiddenTreasures.size==0)
        valid =  true
      end
      puts "EN isEmpty; valor de valid = #{valid}\n\n\n"
      valid
    end

    def kills
      @death
    end

    def substractVisibleTreasure(t)
      puts "En substractVisibleTreasure"
      eliminado = false 
      found = false
      i = 0
      indice = 0
      if @specificVisibleTreasures.size != 0
        puts "Tamaño no nulo \n\n\n"
         @specificVisibleTreasures.each{|x|
           puts "Buscando\n\n\n"
            if !found && x == t.type
                indice = i
                found = true
            end
            i+=1
        }
        if found
          puts "Se ha eliminado el tesoro\n\n\n"
          @specificVisibleTreasures.delete_at(indice)
          eliminado = true
        end 
      end  
      if !eliminado
        puts "Cambiando por número \n\n\n"
         @nVisibleTreasures = [0,(@nVisibleTreasures-1)].max 
         puts "Valor del número : #{@nVisibleTreasures}"
      end
    end

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
          hCopy << h
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
      puts bad.to_s + "\n\n\n\n"
      return bad;
  
    end
  end

end