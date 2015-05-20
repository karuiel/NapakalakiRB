# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
#        test = Test::GameTester.instance
     
    #   game = Napakalaki.instance
   
       #Se prueba el juego con 2 jugadores
   
   #    test.play(game, 2)
       
  #    end
      
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# and open the template in the editor.

require_relative "Napakalaki"
require_relative "GameTester"



module Model

  class EjemploMain
   
  def self.main
                # Prueba de las clases de la segunda práctica    

        #Obtener enumerados    
        treasureKind = TreasureKind::BOTHHANDS
        resutl = CombatResult::LOSEANDESCAPE
        

        #Prueba clase dado 
        puts "\ndado"
        
        dado = Dice.instance            
        puts dado.nextNumber    


        #Prueba clase Prize
        puts "\nPrize"
        
         t = 1
         l = 1
        premio = Prize.new(t,l)
        puts premio.to_s
       
        #Prueba clase cultist
        puts "\nCultist"
        
        n = "un nombre"
         gl = 1
        cultist = Cultist.new(n,gl)
        puts cultist.getBasicValue
        puts cultist.getSpecialValue
        
        #Prueba clase treasure
        puts "\nTreasure"
        
        nombre = "un nombre"
         g = 1
         min = 1
         max = 2
        tesoro = TreasureKind::NECKLACE
        treasure = Treasure.new(nombre, g, min, max, tesoro)
        puts treasure.to_s
        puts treasure.getBasicValue
        puts treasure.getSpecialValue
        
        
        #Prueba de BadConsequence
        puts "\nBadConsequences"
        visibles = Array.new
        hidden = Array.new
        visibles <<  treasure
        hidden <<  treasure
        
        
        text = "un texto"
        mata = true
        death = DeathBadConsequence.new(text, mata)
        puts death.to_s
        puts death.isEmpty
        #death.substractHiddenTreasure(treasure)
        #death.substractVisibleTreasure(treasure)
        puts death.adjustToFitTreasureLists(visibles, hidden)
        puts death.to_s
        
        
         levels = 1
         nV = 2
         nH = 4
        number = NumberBadConsequence.new(text, levels, nV, nH)
        puts number.to_s
        puts number.isEmpty
        number.substractHiddenTreasure(treasure)
        number.substractVisibleTreasure(treasure)
        puts number.adjustToFitTreasureLists(visibles, hidden)
        puts number.to_s
        
        
        sV = Array.new
        sH = Array.new
        sV << TreasureKind::ARMOR
        sV << TreasureKind::SHOE
        sV << TreasureKind::NECKLACE
        sH << TreasureKind::SHOE
        sH << TreasureKind::BOTHHANDS
        sH << TreasureKind::NECKLACE
        specific = SpecificBadConsequence.new(text, levels,sV,sH)
        puts specific.to_s
        puts specific.isEmpty
        puts specific.adjustToFitTreasureLists(visibles, hidden)
        specific.substractHiddenTreasure(treasure)
        specific.substractVisibleTreasure(treasure)
        puts specific.to_s
        
        
        #Prueba clase monster
        puts "\nMonster"
        
         lC = 2
        monster = Monster.new(n,l,specific,premio,lC)
        puts monster.to_s
        puts monster.getBasicValue
        puts monster.getSpecialValue
        
        #Prueba clase cardDealer
        puts "\nCardDealer"
        
        dealer = CardDealer.instance  
        dealer.initCards
        puts dealer.nextCultist
        puts dealer.nextMonster
        puts dealer.nextTreasure
        dealer.giveMonsterBack(monster)
        
        #Prueba Player
        puts "\n\n\nPlayer"
        
        player = Player.new("nombre")
        puts player.to_s
        player.initTreasures
        puts player.to_s
        puts player.validState
        puts player.isDead
        puts player.makeTreasureVisible(player.getHiddenTreasures.at(0))
        puts player.hasVisibleTreasures
        player.applyPrize(premio)
        puts player.to_s
        puts player.computeGoldCoinsValue(hidden)
        player.combat(monster)
        player.applyBadConsequence(death)
        player.isDead
        
        #Prueba cultist        
        puts "Prueba cultist Player"
        cultistPlayer = CultistPlayer.new(player, cultist)
        puts CultistPlayer.getTotalCultistPlayer()
        puts cultistPlayer.getOponentLevel(monster)
        

  end

end

if $0 == __FILE__
  Model::EjemploMain.main
end
end
