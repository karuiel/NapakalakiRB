# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
#comprobar si esto esta bien hecho (los singleton son un mojon como una casa
class Dice
  include Singleton
  
  
  def initialize
    
  end
  
  def nextNumber
    1 + rand(6)
  end
end
