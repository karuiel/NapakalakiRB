#encoding: utf-8

require_relative "prize.rb"
require_relative "bad_consequence.rb"
require_relative "monster.rb"
require_relative "treasure_kind.rb"

#Examen

class Examen
  def initialize
    
  end
  
  def self.main
    puts "En método main\n"
    #Creación monstruo 1
    name1= "Monstruo 1 examen"
    level1 = 12
    prize1 = Prize.new(2, 0)
    text1 = "Pierdes 2 niveles y 3 tesoros visibles"
    bc1 = BadConsequence.newNumberOfTreasures(text1, 2, 3, 0)
    monster1 = Monster.new(name1, level1, prize1, bc1)
    
    #Creación monstruo 2
    name2= "Monstruo 2 examen"
    level2 = 5
    prize2 = Prize.new(1, 2)
    text2 = "Pierdes 1 tesoro visibles y 2 ocultos"
    bc2 = BadConsequence.newNumberOfTreasures(text2, 0, 1, 2)
    monster2 = Monster.new(name2, level2, prize2, bc2)    
    
    #Creación monstruo 3
    name3= "Monstruo 3 examen"
    level3 = 3
    prize3 = Prize.new(1, 1)
    text3 = "Pierdes una mano visible, otra oculta y una armadura oculta"
    tesoroV = Array.new(1,TreasureKind::ONEHAND)
    tesoroH = Array.new
    tesoroH << TreasureKind::ONEHAND
    tesoroH << TreasureKind::ARMOR
    bc3 = BadConsequence.newSpecificTreasures(text3, level3, tesoroV, tesoroH)
    monster3 = Monster.new(name3, level3, prize3, bc3)
    
    #Creación monstruo 4
    name4= "Monstruo 4 examen"
    level4 = 1
    prize4 = Prize.new(5, 0)
    text4 = "Estas muerto"
    bc4 = BadConsequence.newDeath(text4)
    monster4 = Monster.new(name4, level4, prize4, bc4)
    
    monsters = Array.new
    
    monsters << monster1
    monsters << monster2
    monsters << monster3
    monsters << monster4
    
    puts "Los monstruos son:\n"
    
    monsters.each {|x|
        puts x.to_s
    }

    #Consultas
    puts "\n\nLos monstruos cuyo premio implica una ganancia de 1 o más niveles son: \n"
    monsters.each{ |x|
      if(x.price.levels > 0) 
        puts x.to_s 
      end
    }
    
    puts"\n\nLos monstruos cuyo  mal rollo implica perder una armadura oculta son:\n"
    monsters.each{ |x|
      if(x.bc.specificHiddenTreasures.find{|y| y == TreasureKind::ARMOR})
        puts x.to_s  
      end 
    }
    
    puts "\n\nLos monstrues cuyo mal rollo implica la perdida de nivel son: \n\n"
    monsters.each{ |x|
      if (x.bc.nHiddenTreasures == 2)          
        puts x.to_s + "\n"
      end
    }
    
    puts "\n\nLos monstrues cuyo mal rollo implica la muerte: \n\n"
    monsters.each{ |x|
      if (x.bc.death == true)          
        puts x.to_s + "\n"
      end
    }
    
  end  
  puts Examen.main
end

#Fin Examen