# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

class Dice
  include Singleton
  
  attr_reader :instance
  def initialize
    @instance
  end
  
  def nextNumber
    
  end
end
