# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
require_relative 'Card'
  
class Cultist
  
  include Card
  
  def initialize(name, gL)
    @name = name
    @gainedLevels = gL
  end
  
  def getBasicValue
    @gainedLevels
  end
  
  def getSpecialValus
    @gainedLevels + CultistPlayer.getTotalCulstistPlayer
  end
  
end

end