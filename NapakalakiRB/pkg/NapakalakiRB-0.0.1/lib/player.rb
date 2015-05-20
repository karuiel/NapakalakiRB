#!/usr/bin/env ruby
#encoding: utf-8

##
 # Clase que representa un jugador
 # Invariante de representación:
 #  -El atributo level debe ser un entero comprendido entre 1 y 10
 #  -El atributo hiddenTreasures debe ser tener un tamaño igual o menor a 4
 #  -El atributo visibleTreasures estará constituido por:
 #       uno o ningún tesoro de tipo armor 
 #       uno o ningún tesoro de tipo helmet
 #       uno o ningún tesoro de tipo shoe
 #       uno o ningún tesoro de tipo necklace
 #       uno o ningún tesoro de tipo bothhands
 #       uno, dos o ningún tesoro de tipo onehand en caso de no tener ninguno de tipo
 #           bothhands, y ninguno en caso contrario
 #      
 #
require_relative "treasure.rb"
require_relative "monster.rb"
require_relative "bad_consequence.rb"
module Model
  class Player

    attr_reader :MAXHIDDENTREASURES 
    attr_reader :hiddenTreasures
    attr_reader :visibleTreasures
    attr_reader :name
    attr_reader :pendingBadConsequence
    attr_reader :level
    @@MAXHIDDENTREASURES = 4

##
 #  Constuctor de la clase
 #  String name: nombre del jugador   
 #
    def initialize(name)
      @dead = false
      @name = name
      @level = 1
      @visibleTreasures = Array.new
      @hiddenTreasures = Array.new
      @pendingBadConsequence = nil    
    end
    
    def newPlayer(player)
      @dead = player.isDead
      @name = player.getName
      @level = player.level
      @visibleTreasures = player.getVisibleTreasures
      @hiddenTreasures = player.getHiddenTreasures
      @pendingBadConsequence = player.pendingBadConsequence
    end
    
    ##
     #  Método para obtener el nivel de combate del jugador
     # devuelve  int: nivel de combate
    #
    def getCombatLevel
      total_level = @level
      collar = false

      #Bucle de búsqueda del collar
      @visibleTreasures.each{|x|
        if(x.type == TreasureKind::NECKLACE)
          collar=true
        end
      }

      #Bucles de recuento de niveles
      if(collar==true)
        @visibleTreasures.each{|x|
          total_level += x.maxBonus
        }
      else
        @visibleTreasures.each{|x|
          total_level += x.minBonus
        }
      end
      total_level
    end
      
     ##
     #  Consultor hiddenTreasures
     # devuelve  ArrayList<Treasures>: hiddenTreasures
    #
      def getHiddenTreasures
        @hiddenTreasures
      end
      
      ##
     #  Consultor visibleTreasures
     # devuelve  ArrayList<Treasures>: visibleTreasures
    #
      def getVisibleTreasures
        @visibleTreasures
      end
      
     ##
     #  Consultor del atributo name
     # devuelve  String: name
    #
      def getName
        @name
      end
      
      def getOponentLevel(m)
        m.combatLevel
      end
      
      
    #EXAMEN
    def setVisibleTreasureList vl
      @visibleTreasures = vl
      
    end
    
    def setHiddenTreasureList ht
      @hiddenTreasures = ht
    end
    
    #FINEXAMEN
    
    def shouldConvert
      dice = Dice.instance
      number = dice.nextNumber
      
      if number == 6
        should = true
      else 
        should = false
      end
      should
    end
    
    
    ##
     #  Método encargado de revivir al jugador
    #
    def bringToLife  
      @dead = false    
    end  

        ##
     #  Método para subir niveles al jugador
     #  int l: número de niveles a subir
    #
    def incrementLevels(l)
      if(l>0)
        if((@level + l)>10)
          @level=10
        else
          @level += l
        end
      end
    end  

     ##
     #  Método para bajar niveles al jugador
     #  int l: número de niveles a decrementar
    #
    def  decrementLevels(l)
      if(l>0)
        if((@level - l)<=0)
          @level=1
        else
          @level -= l
        end
      end
    end  


     ##
     #  Método para asignar un mal rollo al jugador
     #  BadConsequence b: mal rollo a asignar
     #
    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end  

    ##
    #  Método encargado de gestionar la muerte del jugador
    #
    def die
      dealer = CardDealer.instance
      @dead = true
        @visibleTreasures.each{|x|
            dealer.giveTreasureBack(x)
        }
        @visibleTreasures.clear
        
        @hiddenTreasures.each{|x|
            dealer.giveTreasureBack(x)
        }
        @hiddenTreasures.clear
           
    end

    ##
    #  Método encargado de descartar el collar si está visible
    #
    def discardNecklaceIfVisible
      dealer = CardDealer.instance
        @visibleTreasures.each{|x|
            if x.type==TreasureKind::NECKLACE
                dealer.giveTreasureBack(x)
                @visibleTreasures.delete(x)
            end
        }
      
    end

     ##
     #  Método para cambiar el estado del jugador a muerto 
     #          en caso de que no tenga tesoros
    #
    def dieIfNoTreasures
      if(@visibleTreasures.size == 0 && @hiddenTreasures.size == 0)
        @dead=true
      end
    end  

    ##
     #  Método para determinar si se pueden comprar una cantidad de niveles
     #  int l: número de niveles a comprar
     # devuelve  boolean: true en caso de que el incremento no suponga ganar la partida
     #                  false en caso contrario
    #
    def canIBuyLevels(l)
      if((@level + l)<10)
        true
      else
        false
      end
    end  

     ##
     #  Método encargado de calcular los niveles que proporcionan una lista 
     #          de tesoros
     #  ArrayList<Treasure> t: tesoros 
     # devuelve  float: niveles que se pueden comprar
    #
    def computeGoldCoinsValue(t)
      coins = 0
        t.each{|x|
          coins += x.getGoldCoins()
        }
        
        levels = coins / 1000
        levels
    end

     ##
     #  Método encargado de recibir un premio
     #  Prize p: premio a recibir
    #
    def applyPrize(p)
        nLevels = p.levels
        incrementLevels(nLevels)
        dealer = CardDealer.instance
        nPrize = p.treasures
        
        for i in (1..nPrize)
            treasure = dealer.nextTreasure()
            @hiddenTreasures << treasure
        end     
    end

     ##
     #  Método encargado de combatir contra un monstruo
     #  Monster m: monstruo contra el que combatir
     # devuelve  CombatResult: resultado del combate
    #
    def combat(m)
        myLevel = getCombatLevel
        levelMonster = getOponentLevel(m) 
        
        if myLevel > levelMonster
            prize = m.getPrize
            applyPrize(prize)
            if(@level < 10)
                result = CombatResult::WIN
            
            else
                result = CombatResult::WINANDWINGAME
            end   
        
        else
            dice = Dice.instance
            escape = dice.nextNumber
            if(escape < 5)
                bad = m.getBadConsequence()
                amIDead = bad.kills()
                
                if(amIDead)
                    die()
                    result = CombatResult::LOSEANDDIE
                
                else
                    applyBadConsequence(bad)
                    result = CombatResult::LOSE
                    if !isDead 
                      convert = shouldConvert
                      
                      if convert
                          result = CombatResult::LOSEANDCONVERT
                      end    
                    end           
                end
            
            else
                result = CombatResult::LOSEANDESCAPE
            
            end
        end    
        discardNecklaceIfVisible
        return result
      
    end

     ##
     #  Método encargado de aplicar un mal rollo
     #  BadConsequence bad: mal rollo recibido
    #
    def applyBadConsequence(bad)
      nLevels = bad.getLevels
      decrementLevels(nLevels)
      pendingBad = bad.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)     
    end

     ##
     #  Método encargado de decidir si un tesoro oculto puede pasar a visible
     #  Treasure t: tesoro a hacer visible
     # devuelve  boolean: true en caso en que se pueda hacer visible
     #                   false en caso contrario
    #
    def makeTreasureVisible(t)

      if(canMakeTreasureVisible(t))
        @visibleTreasures << t
        @hiddenTreasures.delete(t) 
        canMake = true;
      
      else       
           canMake = false;
      end
      canMake
    end  

    ##
     #  Método auxiliar para contar las repeticiones de un tesoro en un array
     #  ArrayList<Treasure> treasures: array con los tesoros
     #  TreasureKind t: tesoro a buscar
     # devuelve  int: número de repeticiones
     #
    def contains(treasures, t)
        repetitions = 0
        treasures.each{|x|
            if (x.type == t)
              repetitions +=1
            end
        }
        repetitions
    end
    
    ##
     #  Método encargafdo de determinar si un tesoro que está 
     #         oculto puede pasar a estar visible
     # devuelve  boolean: true en caso en que se pueda pasar a visible
     #                  false en caso contrario
    #
    def canMakeTreasureVisible(t)
        type = t.type
        canMake = false
         
        if ((type == TreasureKind::ONEHAND) || (type == TreasureKind::BOTHHANDS))
            if contains(@visibleTreasures,TreasureKind::BOTHHANDS)==0
                onehand = contains(@visibleTreasures,TreasureKind::ONEHAND)
                if(((onehand < 2) && (type == TreasureKind::ONEHAND)) ||
                         ((onehand == 0) && (TreasureKind::BOTHHANDS == type)))
                    canMake = true
                end
            end
        else
            canMake = (contains(@visibleTreasures,type) == 0)
        end
        canMake
        
    end  

    ##
     #  Método para descartarse de un tesoro visible
     #  Treasure t: tesoro a descartar
    #
    def discardVisibleTreasure(t)
        @visibleTreasures.delete(t)
        if( (!@pendingBadConsequence.isEmpty()))
            @pendingBadConsequence.substractVisibleTreasure(t)
        end
        dealer = CardDealer.instance
        dealer.giveTreasureBack(t)
        dieIfNoTreasures()
    end 

     ##
     #  Método para descartarse de un tesoro oculto
     #  Treasure t: tesoro a descartar
    #
    def discardHiddenTreasure(t)
        @hiddenTreasures.delete(t)
        if( (!@pendingBadConsequence.isEmpty()))
            @pendingBadConsequence.substractVisibleTreasure(t)
        end
        dealer = CardDealer.instance
        dealer.giveTreasureBack(t)
        dieIfNoTreasures()
    end

     ##
     #  Método encargado de gestionar la compra de niveles
     #  ArrayList<Treasure> visible: lista de tesoros visibles a vender
     #  ArrayList<Treasure> hidden: lista de tesoros ocultos a vender
     # devuelve  boolean: true en caso de que se realice la compra
     #                  false en caso contrario
    #
    def buyLevels(visible, hidden)
        levels = computeGoldCoinsValue(visible)
        levels += computeGoldCoinsValue(hidden)
        canI = canIBuyLevels(levels.to_i)
        
        if(canI)
            incrementLevels(levels.to_i)
            visible.each{|v|
                discardVisibleTreasure(v)
            }
            hidden.each{|h|
                discardHiddenTreasure(h)
            }
        end
        return canI;
    end


    ##
     #  Método para determinar si un jugador está en estado válido; es decir:
     #      no tiene más de 4 tesoros ocultos y no tiene mal rollo pendiente
     # devuelve  boolean: true en caso de que se encuentre en estado válido
     #                  false en caso contrario
     #
    def validState
      valid = true
      if (@hiddenTreasures.size>4)
        valid = false
      end
      if(@pendingBadConsequence!=nil) 
        if(!@pendingBadConsequence.isEmpty())
          valid = false
        end
      end
      valid
    end

     ##
     #  Método encargado inicializar los tesoros ocultos 
     # devuelve  boolean: true en caso de éxito
     #                  false en caso contrario
    #
    def initTreasures
        bringToLife
        dealer = CardDealer.instance
        dice = Dice.instance
        number = dice.nextNumber()
        
        if number == 1
            treasure = dealer.nextTreasure()
            @hiddenTreasures << treasure
        
        elsif number < 6 
            for i in (0..1)
                treasure = dealer.nextTreasure
                @hiddenTreasures << treasure
            end
        elsif number == 6
            for j in (0..2)
                treasure = dealer.nextTreasure
                @hiddenTreasures << treasure
            end            
        end    
        return true    
    end  

     ##
     #  Método para determinar si el jugador está muerto
     # devuelve  boolean true en caso de que esté muerto
     #                 false en caso contrario
    #
    def isDead
      @dead
    end

    ##
     #  Método para determinar si un jugador tiene tesoros visibles
     # devuelve  boolean: true en caso de tener tesoros visibles
     #                  fasle en caso contrario
    #
    def hasVisibleTreasures
      hasV = true
      if(@visibleTreasures.size == 0)
        hasV = false
      end
      hasV
    end 

     ##
     #  Método encargado de convertir en String un objeto Player
     # devuelve  String: cadena de texto obtenida
    #
    def to_s
     output =  "Nombre: #{@name}\t nivel: #{@level}\tNivel de Combate: " + getCombatLevel.to_s +
                   "\n\tMuerto = " + @dead.to_s
        if(@pendingBadConsequence != nil)
            output += "\n\tPendingBadConsequence = " + @pendingBadConsequence.to_s
        
        else
            output += "\n\tPendingBadConsequence = [] "
        end
    end
    
    private :bringToLife
    private :incrementLevels
    private :decrementLevels
    private :setPendingBadConsequence
    private :die
    private :discardNecklaceIfVisible
    private :dieIfNoTreasures
    private :canIBuyLevels
    private :contains
    #protected :computeGoldCoinsValue
    protected :shouldConvert

  end
end  