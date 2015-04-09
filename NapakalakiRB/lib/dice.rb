#!/usr/bin/env ruby
#encoding: utf-8

require 'singleton'

module Model
  class Dice
   
    include Singleton
    
    def initialize
      
    end
    
    def nextNumber
      1 + rand(6)
    end
  end
end
