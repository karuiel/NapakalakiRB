#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'
#require_relative "monster.rb"
#require_relative "treasure.rb"

module Model

  class CardDealer
    include Singleton

    ##
     #  Constructor 
    #
    def initialize
      @unusedMonsters = Array.new
      @usedMonsters = Array.new 
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      @unusedCultist = Array.new
      shuffleTreasures
      shuffleMonsters
      shuffleCultists
    end  
    
    
    ##
     #  Método para inicializar el mazo de cartas de tesoros
    #
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

     ##
     #  Método para inicializar el mazo de cartas de monstruos
    #
      def initMonsterCardDeck

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = SpecificBadConsequence.new(
        'Pierdes tu armadura visible y otra oculta', 0, tesoro,tesoro)
        @unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::HELMET)
        vacio = Array.new
        badConsequence = SpecificBadConsequence.new(
        'Embobados con el lindo primigenio te descartas de tu casco visible',
        0, tesoro,vacio)
        @unusedMonsters << Monster.new('Chibithulhu', 2, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::SHOE)
        badConsequence = SpecificBadConsequence.new(
        'El primordial bostezo contagioso. Pierdes el calzado visible.',
        0, tesoro,vacio)
        @unusedMonsters << Monster.new(' El sopor de Dunwich', 2, badConsequence, prize, 0)

        prize = Prize.new(4,1) 
        tesoro = Array.new(1,TreasureKind::ONEHAND)
        badConsequence = SpecificBadConsequence.new(
        'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.' +
        'Descarta 1 mano visible y 1 mano oculta.', 0, tesoro, tesoro)
        @unusedMonsters << Monster.new('Ángeles de la noche ibicenca', 14, badConsequence, prize, 0)

        prize = Prize.new(3,1)
        badConsequence = NumberBadConsequence.new('Pierdes todos tus tesoros visibles',
        0, 80,0)
        @unusedMonsters << Monster.new('El gorrón en el umbral', 10, badConsequence, prize, 0) 

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = SpecificBadConsequence.new(
        'Pierdes la armadura visible', 0, tesoro, vacio)
        @unusedMonsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize, 0)

        prize = Prize.new(1,1)
        tesoro = Array.new(1,TreasureKind::ARMOR)
        badConsequence = SpecificBadConsequence.new(
        'Sientes bichos bajo la ropa. Descarta la armadura visible.', 0, tesoro, vacio)
        @unusedMonsters << Monster.new('Bichgooth', 2, badConsequence, prize, 0)

        prize = Prize.new(4,2) 
        badConsequence = NumberBadConsequence.new('Pierdes 5 niveles y 3 tesoros visibles',
                                                        5 , 3, 0)
        @unusedMonsters << Monster.new('El rey de rosa', 13, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        badConsequence = SpecificBadConsequence.new(
        'Toses los pulmones y pierdes dos niveles', 2, vacio,vacio)
        @unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, badConsequence, prize, 0)

        prize = Prize.new(2,1) 
        tesoro = Array.new
        tesoro << TreasureKind::ONEHAND
        tesoro << TreasureKind::ONEHAND
        tesoro << TreasureKind::BOTHHANDS
        badConsequence = SpecificBadConsequence.new('Te faltan manos para tanta cabeza. Pierdes '+
        'tres niveles y tus tesoros visibles de las manos.', 3, tesoro,vacio)
        @unusedMonsters << Monster.new('Bicéfalo', 20, badConsequence, prize, 0);

        prize = Prize.new(2,1) 
        badConsequence = DeathBadConsequence.new(
        "Estos monstruos resultan bastante superficiales y te aburren"+
        "mortalmente. Estas muerto",true)
        @unusedMonsters << Monster.new('Los hondos', 8, badConsequence, prize, 0)

        prize = Prize.new(2,1) 
        badConsequence = NumberBadConsequence.new(
        "Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
        @unusedMonsters << Monster.new('Semillas Cthulhu', 4, badConsequence, prize, 0)

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::ONEHAND)
        badConsequence = SpecificBadConsequence.new(
        "Te intentas escaquear. Pierdes una mano visible",0,tesoro,vacio)
        @unusedMonsters << Monster.new('Dameargo', 1, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        badConsequence = NumberBadConsequence.new(
        "Da mucho asquito. Pierdes 3 niveles",3,0,0)
        @unusedMonsters << Monster.new('Pollipolipo volante', 3, badConsequence, prize, 0)

        prize = Prize.new(3,1) 
        badConsequence = DeathBadConsequence.new(
        "No le hace gracia que pronuncien mal su nombre. Estas muerto", true)
        @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 12, badConsequence, prize, 0)

        prize = Prize.new(4,1) 
        badConsequence = DeathBadConsequence.new(
       "La familia te atrapa.Estas muerto",true)
        @unusedMonsters << Monster.new('Familia Feliz', 1, badConsequence, prize, 0)

        prize = Prize.new(2,1) 
        tesoro = Array.new(1,TreasureKind::BOTHHANDS)
        badConsequence = SpecificBadConsequence.new(
        "La quinta directiva primaria te obliga a perder 2 niveles y"+
        "un tesoro 2 manos visible",2,tesoro,vacio)
        @unusedMonsters << Monster.new('Roboggoth', 8, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        tesoro = Array.new(1,TreasureKind::HELMET)
        badConsequence = SpecificBadConsequence.new(
        "Te asusta en la noche. Pierdes un casco visible.",0,tesoro,vacio)
        @unusedMonsters << Monster.new('El espia', 5, badConsequence, prize, 0)

        prize = Prize.new(1,1) 
        badConsequence = NumberBadConsequence.new(
       "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",2,5,0)
        @unusedMonsters << Monster.new('El Lenguas', 20, badConsequence, prize, 0)
        
        
        tesoro = Array.new(1,TreasureKind.ONEHAND)
        badConsequence = SpecificBadConsequence.new("Pierdes una mano visible" ,0,
                          tesoro, vacio)
        prize = Prize.new(3,1);
        @unusedMonster << Monster.new("El mal indecible impronunciable", 10, badConsequence, prize,-2)
        
        badConsequence = NumberBadConsequence.new("Pierdes tus tesoros visibles. Jajaja",
                                        0, 80,0);
        prize = Prize.new(2,1)
        @unusedMonster << Monster.new("Testigos oculares", 6, badConsequence, prize,2)
        
        badConsequence = DeathBadConsequence.new("Hoy no es tu día de suerte. Mueres", true)
        prize = Prize.new(2,5)
        @unusedMonster << Monster.new("El gran cthulhu", 20, badConsequence, prize,4)
    
        badConsequence = NumberBadConsequence.new("Tu gobierno te recorta 2 niveles",2,0,0)
        prize = Prize.new(2,1)
        @unusedMonster << Monster.new("Serpiente Político", 8, badConsequence, prize,2)
        
        n = Array.new
        n << TreasureKind::HELMET
        n << TreasureKind::ARMOR
        badConsequence = SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible." +
                               "Pierdes tus manos ocultas",0,n, m);
        prize = Prize.new(1,1)
        @unusedMonster << Monster.new("Felpuggoth", 2, badConsequence, prize,5)
        
        badConsequence = NumberBadConsequence.new("Pierdes 2 niveles",2,0,0)
        prize = Prize.new(4,2)
        @unusedMonster << Monster.new("Shoggoth", 16, badConsequence, prize,-4)
        
        badConsequence = NumberBadConsequence.new("Pintalabios negro. Pierdes 2 niveles",
                          2,0,0)
        prize = Prize.new(1,1)
        @unusedMonster <<  Monster.new("Lolitagoth", 2, badConsequence, prize,3)
        
        


      end
      
      def initCultistCardDeck
        name = "Sectario"
        level = 1
        c = Cultist.new(name,level)
        @unusedCultist << c
        
        level = 2
        c = Cultist.new(name,level)
        @unusedCultist << c
        
        level = 1
        c = Cultist.new(name,level)
        @unusedCultist << c
        
        level = 2
        c = Cultist.new(name,level)
        @unusedCultist << c
        
        level = 1
        c = Cultist.new(name,level)
        @unusedCultist << c
        
        level = 1
        c = Cultist.new(name,level)
        @unusedCultist << c
        
    
      end

      ##
     #  Método para barajar el mazo de cartar unusedTreasures
    #
      def shuffleTreasures
        @unusedTreasures.shuffle! 
      end

      ##
     #  Método para barajar el mazo de cartar unusedMonsters
    #
      def shuffleMonsters
        @unusedMonsters.shuffle!
      end
      
      def shuffleCultists
        @unusedCultist.shuffle!
      end

      ##
     #  Método que devuelve la siguiente carta de tesoro
     # devuelve  Treasure: siguiente tesoro
    #
      def nextTreasure
        if @unusedTreasures.size != 0         
          nextTreasure = @unusedTreasures.at(0)
          @unusedTreasures.delete_at(0)
          
        else
          @usedTreasures.each{|t|
            @unusedTreasures << t
          }
          @usedTreasures= Array.new
          shuffleTreasures
          nextTreasure = @unusedTreasures.at(0)
          @unusedTreasures.delete_at(0)
        end
        nextTreasure
      end

      ##
     #  Método que devuelve la siguiente carta de monstruo
     # devuelve  Monster: siguiente monstruo
    #
      def nextMonster
        if @unusedMonsters.size != 0
          nextTreasure = @unusedMonsters.at(0)
          @unusedMonsters.delete_at(0)
          
        else
          @usedMonster.each{|m|
            @unusedMonsters << m
          }
          @usedMonsters = Array.new
          shuffleMonsters
          nextTreasure = @unusedMonsters.at(0)
          @unuedMonsters.delete_at(0)
        end
        nextTreasure
      end
      
      def nextCultist
        nextCultist = @unusedCultist.at(0)
        @unusedCultist.delete_at(0)
        nextCultist
      end
      ##
     #  Método para incluir una carta de tesoro en el mazo de usadas
    #
      def giveTreasureBack(t)
        @usedTreasures << t
      end

      ##
     #  Método para incluir una carta de monstruo en el mazo de usadas
    #
      def giveMonsterBack(m)
        @usedMonsters << m
      end
      
      ##
     #  Método para inicializar los mazos de cartas
    #
      def initCards
        initTreasureCardDeck
        initMonsterCardDeck
        initCultistCardDeck
        shuffleMonsters
        shuffleTreasures
        shuffleCultists
      end

    private :initTreasureCardDeck
    private :initMonsterCardDeck
    private :initCultistCardDeck
    private :shuffleTreasures
    private :shuffleMonsters
    private :shuffleCultists

  end
end