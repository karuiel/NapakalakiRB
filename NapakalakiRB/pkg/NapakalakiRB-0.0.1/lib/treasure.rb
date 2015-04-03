# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Treasure
    attr_reader :name
    attr_reader :goldCoins;
    attr_reader :minBonus;
    attr_reader :maxBonus;
    attr_reader :type;
    
  def initialize (n, g, min, max, t)
    @name = n
    @goldCoins = g
    @minBonus = min
    @minbonus = max
    @type = t
  end
end
