# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Model
require_relative "Napakalaki"

class Examen4
  
  
  @@instance = Examen4.new;
  @@ejecuciones = 0
  
  def self.getInstance
    @@instance
  end
  
  def initialize
    @@ejecuciones = 0
  end
  
  def getExecutions
    @@ejecuciones
  end
  
  def self.run
    @@ejecuciones += 1
    t1 = Array.new
    t2 = Array.new
    
    p1 = Player.new("name")
    p2 = Player.new("name")
    
    nombre = "un nombre"
        g = 1
        min = 1
        max = 2
        tesoro = TreasureKind::ONEHAND
        treasure = Treasure.new(nombre, g, min, max, tesoro)
        
    t1 << treasure
    t2 << treasure

        
    nombre = "un nombre"
        g = 1
        min = 1
        max = 2
        tesoro = TreasureKind::NECKLACE
        treasure = Treasure.new(nombre, g, min, max, tesoro)
    t1 << treasure
    t2 << treasure
   
    nombre = "un nombre"
        g = 1
        min = 1
        max = 2
        tesoro = TreasureKind::SHOE
        treasure = Treasure.new(nombre, g, min, max, tesoro)
    t1 << treasure
    t2 << treasure

    
    p1.setVisibleTreasureList(t1)
    p1.setHiddenTreasureList(t2)
    p2.setVisibleTreasureList(t1)
    p2.setHiddenTreasureList(t2)
    
    t1.each{|x|
      puts x.to_s
    }
    
    t2.each{|x|
      puts x.to_s
    }
    
    puts p1.to_s
    puts p2.to_s
    puts p1.getCombatLevel
    puts p2.getCombatLevel
    
    n = "un nombre"
        gl = 1
        cultist = Cultist.new(n,gl)
        
    n = "un nombre"
        gl = 1
        cultist2 = Cultist.new(n,gl)
    
    p2 = CultistPlayer.new(p2,cultist2)
    
    puts p1.to_s
    puts p2.to_s
    puts p1.getCombatLevel
    puts p2.getCombatLevel
    
    p1 = CultistPlayer.new(p1,cultist)
    
    puts p1.to_s
    puts p2.to_s
    puts p1.getCombatLevel
    puts p2.getCombatLevel
    
    t3 = Array.new
    t4 = Array.new
    
    p1.setVisibleTreasureList(t3)
    p2.setVisibleTreasureList(t3)
    p1.setHiddenTreasureList(t4)
    p2.setHiddenTreasureList(t4)
    
    levels = 1
    nV = 4
    nH = 0
    number = NumberBadConsequence.new("text", levels, nV, nH)
    puts number.to_s
    bc = number.adjustToFitTreasureLists(t1, t2)
    puts bc.to_s
    
    
    
    
    sV = Array.new
    sH = Array.new
        sV << TreasureKind::ONEHAND
        sV << TreasureKind::ONEHAND
        sV << TreasureKind::BOTHHANDS
        specific = SpecificBadConsequence.new("text", levels,sV,sH)
    puts specific.to_s
    bc2 = specific.adjustToFitTreasureLists(t1, t2)
    puts bc2.to_s
    
    
    text = "un texto"
    mata = true
    death = DeathBadConsequence.new(text, mata)
    puts death.to_s
    bc3 = death.adjustToFitTreasureLists(t1, t2)
    puts bc3.to_s
    
  end
  private_class_method :new
end  

  e4 = Examen4.getInstance
  Examen4.run
  
  puts e4.getExecutions
  
end
