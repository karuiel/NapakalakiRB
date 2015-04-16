#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'
#require_relative "monster.rb"
#require_relative "treasure.rb"

module Model

  class CardDealer
    include Singleton


    def initialize
      @unusedMonsters = Array.new
      @usedMonsters = Array.new 
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      initTreasureCardDeck
      initMonsterCardDeck
      shuffleTreasures
      shuffleMonsters
    end  


      def initTreasureCardDeck
          name = "¡Sí mi amo!"
          goldCoins = 0
          minBonus = 4
          maxBonus = 7
          type = TreasureKind::HELMET
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus,type)

          name = "Botas de investigación"
          goldCoins = 600
          minBonus = 3
          maxBonus = 4
          type = TreasureKind::SHOE
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Capucha de Cthulhu"
          goldCoins = 500
          minBonus = 3
          maxBonus = 5
          type = TreasureKind::HELMET
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "A prueba de babas"
          goldCoins = 400
          minBonus = 2
          maxBonus = 5
          type = TreasureKind::ARMOR
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Botas de lluvia ácida"
          goldCoins = 800
          minBonus = 1
          maxBonus = 1
          type = TreasureKind::BOTHHANDS
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Casco minero"
          goldCoins = 400
          minBonus = 2
          maxBonus = 4
          type = TreasureKind::HELMET
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Ametralladora Thompson"
          goldCoins = 600
          minBonus = 4
          maxBonus = 8
          type = TreasureKind::BOTHHANDS
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Camiseta de la UGR"
          goldCoins = 100
          minBonus = 1
          maxBonus = 7
          type = TreasureKind::ARMOR
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Clavo de rail ferroviario"
          goldCoins = 400
          minBonus = 3
          maxBonus = 6
          type = TreasureKind::ONEHAND
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Cuchillo de sushi arcano"
          goldCoins = 300
          minBonus = 2
          maxBonus = 3
          type = TreasureKind::ONEHAND
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Fez alópodo"
          goldCoins = 700
          minBonus = 3
          maxBonus = 5
          type = TreasureKind::HELMET
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Hacha prehistórica"
          goldCoins = 500
          minBonus = 2
          maxBonus = 5
          type = TreasureKind::ONEHAND
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "El aparato del Pr. Tesla"
          goldCoins = 900
          minBonus = 4
          maxBonus = 8
          type = TreasureKind::ARMOR
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Gaita"
          goldCoins = 500
          minBonus = 4
          maxBonus = 5
          type = TreasureKind::BOTHHANDS
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Insecticida"
          goldCoins = 300
          minBonus = 2
          maxBonus = 3
          type = TreasureKind::ONEHAND
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)

          name = "Escopeta de 3 cañones"
          goldCoins = 700
          minBonus = 4
          maxBonus = 6
          type = TreasureKind::BOTHHANDS
          @unusedTreasures << Treasure.new(name, goldCoins, minBonus, maxBonus, type)
      end 

      def initMonsterCardDeck

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = BadConsequence.newSpecificTreasures(
        'Pierdes tu armadura visible y otra oculta', 0, tesoro,tesoro)
        @unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::HELMET)
        vacio = Array.new
        badConsequence = BadConsequence.newSpecificTreasures(
        'Embobados con el lindo primigenio te descartas de tu casco visible',
        0, tesoro,vacio)
        @unusedMonsters << Monster.new('Chibithulhu', 2, badConsequence, prize)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::SHOE)
        badConsequence = BadConsequence.newSpecificTreasures(
        'El primordial bostezo contagioso. Pierdes el calzado visible.',
        0, tesoro,vacio)
        @unusedMonsters << Monster.new(' El sopor de Dunwich', 2, badConsequence, prize)

        prize = Prize.new(4,1) 
        tesoro = Array.new(1,TreasureKind::ONEHAND)
        badConsequence = BadConsequence.newSpecificTreasures(
        'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.' +
        'Descarta 1 mano visible y 1 mano oculta.', 0, tesoro, tesoro)
        @unusedMonsters << Monster.new('Ángeles de la noche ibicenca', 14, badConsequence, prize)

        prize = Prize.new(3,1)
        badConsequence = BadConsequence.newNumberOfTreasures('Pierdes todos tus tesoros visibles',
        0, 80,0)
        @unusedMonsters << Monster.new('El gorrón en el umbral', 10, badConsequence, prize) 

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = BadConsequence.newSpecificTreasures(
        'Pierdes la armadura visible', 0, tesoro, vacio)
        @unusedMonsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)

        prize = Prize.new(1,1)
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = BadConsequence.newSpecificTreasures(
        'Sientes bichos bajo la ropa. Descarta la armadura visible.', 0, tesoro, vacio)
        @unusedMonsters << Monster.new('Bichgooth', 2, badConsequence, prize)

        prize = Prize.new(4,2) 
        badConsequence = BadConsequence.newNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',
                                                        5 , 3, 0)
        @unusedMonsters << Monster.new('El rey de rosa', 13, badConsequence, prize)

        prize = Prize.new(1,1) 
        badConsequence = BadConsequence.newSpecificTreasures(
        'Toses los pulmones y pierdes dos niveles', 2, vacio,vacio)
        @unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, badConsequence, prize)

        prize = Prize.new(2,1) 
        badConsequence = BadConsequence.newNumberOfTreasures(
       'Te faltan manos para tanta cabeza. Pierdes tres niveles y'+
        'tus tesoros visibles de las manos.', 3, 80,0)
        @unusedMonsters << Monster.new('Bicéfalo', 20, badConsequence, prize)

        prize = Prize.new(2,1) 
        badConsequence = BadConsequence.newDeath(
        "Estos monstruos resultan bastante superficiales y te aburren"+
        "mortalmente. Estas muerto",true)
        @unusedMonsters << Monster.new('Los hondos', 8, badConsequence, prize)

        prize = Prize.new(2,1) 
        badConsequence = BadConsequence.newNumberOfTreasures(
        "Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
        @unusedMonsters << Monster.new('Semillas Cthulhu', 4, badConsequence, prize)

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ONEHAND)
        badConsequence = BadConsequence.newSpecificTreasures(
        "Te intentas escaquear. Pierdes una mano visible",0,tesoro,vacio)
        @unusedMonsters << Monster.new('Dameargo', 1, badConsequence, prize)

        prize = Prize.new(1,1) 
        badConsequence = BadConsequence.newNumberOfTreasures(
        "Da mucho asquito. Pierdes 3 niveles",3,0,0)
        @unusedMonsters << Monster.new('Pollipolipo volante', 3, badConsequence, prize)

        prize = Prize.new(3,1) 
        badConsequence = BadConsequence.newDeath(
        "No le hace gracia que pronuncien mal su nombre. Estas muerto", true)
        @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 12, badConsequence, prize)

        prize = Prize.new(4,1) 
        badConsequence = BadConsequence.newDeath(
       "La familia te atrapa.Estas muerto",true)
        @unusedMonsters << Monster.new('Familia Feliz', 1, badConsequence, prize)

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::BOTHHANDS)
        badConsequence = BadConsequence.newSpecificTreasures(
        "La quinta directiva primaria te obliga a perder 2 niveles y"+
        "un tesoro 2 manos visible",2,tesoro,vacio)
        @unusedMonsters << Monster.new('Roboggoth', 8, badConsequence, prize)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::HELMET)
        badConsequence = BadConsequence.newSpecificTreasures(
        "Te asusta en la noche. Pierdes un casco visible.",0,tesoro,vacio)
        @unusedMonsters << Monster.new('El espia', 5, badConsequence, prize)

        prize = Prize.new(1,1) 
        badConsequence = BadConsequence.newNumberOfTreasures(
       "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",2,5,0)
        @unusedMonsters << Monster.new('El Lenguas', 20, badConsequence, prize)


      end

      def shuffleTreasures
        @unusedTreasures.shuffle! 
      end

      def shuffleMonsters
        @unusedMonsters.shuffle!
      end

      def nextTreasure
        if @unusedTreasures.size != 0
          nextTreasure = @unusedTreasures.at(0);
          @unusedTreasures.delete_at(0)
          
        elsif
          @unusedTreasures = @usedTreasures
          @unusedTreasures.shuffle!
          nextTreasure = @unusedTreasures.at(0)
        end
        nextTreasure
      end

      def nextMonster
        if @unusedMonster.size != 0
          nextTreasure = @unusedMonster.at(0);
          @unusedMonster.delete_at(0)
          
        elsif
          @unusedMonster = @usedMonster
          @unusedMonster.shuffle!
          nextTreasure = @unusedMonster.at(0)
        end
        nextTreasure
      end

      def giveTreasureBack(t)
        @usedTreasures << t
      end

      def giveMonsterBack(m)
        @usedMonsters << m
      end

      def initCards
      end

    private :initTreasureCardDeck
    private :initMonsterCardDeck
    private :shuffleTreasures
    private :shuffleMonsters

  end
end