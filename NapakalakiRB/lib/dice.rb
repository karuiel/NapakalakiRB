#!/usr/bin/env ruby
#encoding: utf-8

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