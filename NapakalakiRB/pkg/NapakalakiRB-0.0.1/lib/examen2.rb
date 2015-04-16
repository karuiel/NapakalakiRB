#!/usr/bin/env ruby
#encoding: utf-8
#Examen
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
module Model
class Examen2
  def initialize
    
  end
  
  def run
    arrayvisible = Array.new
    arrayhidden = Array.new
    name = "Insecticida"
          goldCoins = 300
          minBonus = 2
          maxBonus = 3
          type = TreasureKind::ONEHAND
          arrayvisible << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
          arrayvisible << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
          arrayvisible << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    jugador = Player.new("Migue")
    jugador.setVisibleTreasureList(arrayvisible)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    arrayhidden << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
    jugador.setHiddenTreasureList(arrayhidden)
    puts jugador.validState
  end
  
end
prueba = Examen2.new
prueba.run

end
#Fin EXAMEN
