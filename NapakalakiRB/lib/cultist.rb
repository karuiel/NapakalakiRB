# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  

require_relative 'card'
require_relative "cultist_player.rb"
class Cultist
  
  include Card
  
  def initialize(name, gL)
    @name = name
    @gainedLevels = gL
  end
  
  def getBasicValue
    @gainedLevels
  end
  
  def getSpecialValue
    @gainedLevels + CultistPlayer.getTotalCultistPlayer()
  end
  
  def to_s
        
    output = "Nombre: " + @name + "\t\tGainedLevels = " + @gainedLevels.to_s
        output
  end
  
end

end