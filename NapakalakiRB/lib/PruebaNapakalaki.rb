#encoding: utf-8

module Model
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
  require_relative "dice.rb"
  require_relative "player.rb"
  require_relative "card_dealer.rb"
  require_relative "combat_result.rb"
  require_relative "napakalaki.rb"
  require_relative "treasure.rb"


  #Prueba Práctica 2

  #Prueba dice
  dado = Dice.instance
  puts dado.nextNumber

  #Prueba BadConsequence
  bc = BadConsequence.newDeath("vacio",false)
  puts bc.isEmpty
  puts bc.kills

  #Prueba de la clase tesoro
  n = "nombre"
  g = 1000
  min = 1
  max = 4
  t = TreasureKind::SHOE
  treasure = Treasure.new(n, g, min, max, t)
  puts treasure.name

  #Prueba clase player
  jugador = Player.new("maria")
  puts jugador.validState
  puts jugador.isDead
  puts jugador.getCombatLevel

  #Prueba clase CardDealer
  crupier = CardDealer.instance 
  crupier.giveTreasureBack(treasure)

  
end  
=begin

#-----------------------------Prueba Sesión 1--------------------------

price = Prize.new(1,1)
puts "Premio creado: " + price.to_s

text =  "Sientes bichos bajo la ropa. Descarta la armadura visible."
bc1 =  BadConsequence.newNumberOfTreasures(text,0,1,0)
bc2 = BadConsequence.newDeath(text,true)
treasure = Array.new(1, TreasureKind::SHOE) 
bc3= BadConsequence.newSpecificTreasures(text, 5, treasure, treasure)
puts "Malos rollos creados:" , bc1.to_s, bc2.to_s, bc3.to_s       
   
myMonster =  Monster.new('Monstruito', 8, bc1, price)
puts "Monstruo creado: " + myMonster.to_s


#---------------------------Declaración de los monstruos------------------------


monsters = Array.new


prize = Prize.new(2,1) 
tesoro = Array.new(1,TreasureKind::ARMOR)
badConsequence = BadConsequence.newSpecificTreasures(
  'Pierdes tu armadura visible y otra oculta', 0, tesoro,tesoro)
monsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)

prize = Prize.new(1,1) 
tesoro = Array.new(1,TreasureKind::HELMET)
vacio = Array.new
badConsequence = BadConsequence.newSpecificTreasures(
    'Embobados con el lindo primigenio te descartas de tu casco visible',
    0, tesoro,vacio)
monsters << Monster.new('Chibithulhu', 2, badConsequence, prize)

prize = Prize.new(1,1) 
tesoro = Array.new(1,TreasureKind::SHOE)
badConsequence = BadConsequence.newSpecificTreasures(
    'El primordial bostezo contagioso. Pierdes el calzado visible.',
    0, tesoro,vacio)
monsters << Monster.new(' El sopor de Dunwich', 2, badConsequence, prize)

prize = Prize.new(4,1) 
tesoro = Array.new(1,TreasureKind::ONEHAND)
badConsequence = BadConsequence.newSpecificTreasures(
    'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.' +
    'Descarta 1 mano visible y 1 mano oculta.', 0, tesoro, tesoro)
monsters << Monster.new('Ángeles de la noche ibicenca', 14, badConsequence, prize)

prize = Prize.new(3,1)
badConsequence = BadConsequence.newNumberOfTreasures('Pierdes todos tus tesoros visibles',
    0, 80,0)
monsters << Monster.new('El gorrón en el umbral', 10, badConsequence, prize) 

prize = Prize.new(2,1) 
tesoro = Array.new(1,TreasureKind::ARMOR)
badConsequence = BadConsequence.newSpecificTreasures(
    'Pierdes la armadura visible', 0, tesoro, vacio)
monsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)

prize = Prize.new(1,1)
tesoro = Array.new(1,TreasureKind::ARMOR)
badConsequence = BadConsequence.newSpecificTreasures(
    'Sientes bichos bajo la ropa. Descarta la armadura visible.', 0, tesoro, vacio)
monsters << Monster.new('Bichgooth', 2, badConsequence, prize)

prize = Prize.new(4,2) 
badConsequence = BadConsequence.newNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',
                                                      5 , 3, 0)
monsters << Monster.new('El rey de rosa', 13, badConsequence, prize)

prize = Prize.new(1,1) 
badConsequence = BadConsequence.newSpecificTreasures(
    'Toses los pulmones y pierdes dos niveles', 2, vacio,vacio)
monsters << Monster.new('La que redacta en las tinieblas', 2, badConsequence, prize)

prize = Prize.new(2,1) 
badConsequence = BadConsequence.newNumberOfTreasures(
    'Te faltan manos para tanta cabeza. Pierdes tres niveles y'+
    'tus tesoros visibles de las manos.', 3, 80,0)
monsters << Monster.new('Bicéfalo', 20, badConsequence, prize)

prize = Prize.new(2,1) 
badConsequence = BadConsequence.newDeath(
    "Estos monstruos resultan bastante superficiales y te aburren"+
   "mortalmente. Estas muerto",true)
monsters << Monster.new('Los hondos', 8, badConsequence, prize)

prize = Prize.new(2,1) 
badConsequence = BadConsequence.newNumberOfTreasures(
    "Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
monsters << Monster.new('Semillas Cthulhu', 4, badConsequence, prize)

prize = Prize.new(2,1) 
tesoro = Array.new(1,TreasureKind::ONEHAND)
badConsequence = BadConsequence.newSpecificTreasures(
    "Te intentas escaquear. Pierdes una mano visible",0,tesoro,vacio)
monsters << Monster.new('Dameargo', 1, badConsequence, prize)

prize = Prize.new(1,1) 
badConsequence = BadConsequence.newNumberOfTreasures(
    "Da mucho asquito. Pierdes 3 niveles",3,0,0)
monsters << Monster.new('Pollipolipo volante', 3, badConsequence, prize)

prize = Prize.new(3,1) 
badConsequence = BadConsequence.newDeath(
    "No le hace gracia que pronuncien mal su nombre. Estas muerto", true)
monsters << Monster.new('Yskhtihyssg-Goth', 12, badConsequence, prize)

prize = Prize.new(4,1) 
badConsequence = BadConsequence.newDeath(
    "La familia te atrapa.Estas muerto",true)
monsters << Monster.new('Familia Feliz', 1, badConsequence, prize)

prize = Prize.new(2,1) 
tesoro = Array.new(1,TreasureKind::BOTHHANDS)
badConsequence = BadConsequence.newSpecificTreasures(
    "La quinta directiva primaria te obliga a perder 2 niveles y"+
      "un tesoro 2 manos visible",2,tesoro,vacio)
monsters << Monster.new('Roboggoth', 8, badConsequence, prize)

prize = Prize.new(1,1) 
tesoro = Array.new(1,TreasureKind::HELMET)
badConsequence = BadConsequence.newSpecificTreasures(
    "Te asusta en la noche. Pierdes un casco visible.",0,tesoro,vacio)
monsters << Monster.new('El espia', 5, badConsequence, prize)

prize = Prize.new(1,1) 
badConsequence = BadConsequence.newNumberOfTreasures(
    "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",2,5,0)
monsters << Monster.new('El Lenguas', 20, badConsequence, prize)


#---------------------------------Consultas-----------------------------------

puts "\nLos monstruos con un nivel superior que 10 son: \n"
  monsters.each{ |x| 
    if x.combatLevel>10
      puts x.to_s + "\n"
  end    
  }
puts "\n\nLos monstrues cuyo mal rollo solo implica la perdida de nivel son: \n\n"
monsters.each{ |x|
  if ((x.bc.nHiddenTreasures && x.bc.nVisibleTreasures)==0)&&(x.bc.levels!=0) &&
      (!x.bc.kills)
    puts x.to_s + "\n"
  end
}
  
puts "\n\nLos monstruos cuyo buen rollo implica una ganancia de más de un nivel son: \n"
  monsters.each{ |x|
    if(x.price.levels > 1) 
      puts x.to_s 
    end
  }

puts"\n\nLos monstruos cuyo  mal rollo supone la perdida de al menos un tesoro ONEHAND son:\n"
  monsters.each { |x|
    if(x.bc.specificVisibleTreasures.find{|y| y == TreasureKind::ONEHAND})
      puts x.to_s 
    else if(x.bc.specificHiddenTreasures.find{|y| y == TreasureKind::ONEHAND})
      puts x.to_s 
    end 
    end
  }  
=end