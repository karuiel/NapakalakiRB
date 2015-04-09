#!/usr/bin/env ruby
#encoding: utf-8

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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

  @@instance = Examen2.new;
  def initialize
    
  end
  
  def self.getInstance
    @@instance
  end
  
  def self.run
    jugador = Player.new("maria")
    unusedTreasures = Array.new
    name = "¡Sí mi amo!"
          goldCoins = 0
          minBonus = 4
          maxBonus = 7
          type = TreasureKind::HELMET
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus,type)

          name = "Botas de investigación"
          goldCoins = 600
          minBonus = 3
          maxBonus = 4
          type = TreasureKind::SHOE
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Capucha de Cthulhu"
          goldCoins = 500
          minBonus = 3
          maxBonus = 5
          type = TreasureKind::HELMET
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
          
    jugador.setVisibleTreasureList(unusedTreasures)
    
        name = "¡Sí mi amo!"
          goldCoins = 0
          minBonus = 4
          maxBonus = 7
          type = TreasureKind::HELMET
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus,type)

          name = "Botas de investigación"
          goldCoins = 600
          minBonus = 3
          maxBonus = 4
          type = TreasureKind::SHOE
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Capucha de Cthulhu"
          goldCoins = 500
          minBonus = 3
          maxBonus = 5
          type = TreasureKind::HELMET
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
              name = "¡Sí mi amo!"
          goldCoins = 0
          minBonus = 4
          maxBonus = 7
          type = TreasureKind::HELMET
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus,type)

          name = "Botas de investigación"
          goldCoins = 600
          minBonus = 3
          maxBonus = 4
          type = TreasureKind::SHOE
          unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

    jugador.setHiddenTreasureList(unusedTreasures)
    puts "¿Es válido el estado del jugador?"
    puts jugador.validState
    
    badC = BadConsequence.newSpecificTreasures("mal rollo", 0, Array.new ,Array.new)
    j2 = Player.new("j2")
    j2.setPendingBadConsequence(badC)
    
    
    puts "¿Es válido el estado del jugador 2?"
    puts j2.validState
    
    bc2 = BadConsequence.newNumberOfTreasures("bc", 0, 0, 0)
    j3 = Player.new("jj")
    j3.setPendingBadConsequence(bc)
    
    
    puts "¿Es válido el estado del jugador 3?"
    puts j3.validState
    t = Array.new
    t << TreasureKind::SHOE
    bc3 = BadConsequence.newSpecificTreasures("j", 0, Array.new, t)
    j4 =  Player.new("sldfh")
    
  end
    private_class_method :new
end

e2 = Examen2.getInstance
Examen2.run

end

