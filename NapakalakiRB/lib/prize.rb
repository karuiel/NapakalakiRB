#encoding: utf-8

class Prize
  
  attr_reader :treasures, :levels
  
  def initialize(someTreasures, someLevels)
    if someTreasures > 0
      @treasures = someTreasures
    else 
      @treasures = 0
    end
    
    if someLevels > 0
      @levels = someLevels
    else 
      @levles = 0
    end  
  end
  
  def to_s
    "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@levels}"
  end
end
