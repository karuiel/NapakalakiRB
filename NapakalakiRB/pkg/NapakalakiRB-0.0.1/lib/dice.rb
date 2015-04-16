#!/usr/bin/env ruby
#encoding: utf-8
module Model
  require 'singleton'
  class Dice
    include Singleton

    def nextNumber
      1 + rand(6)
    end
  end
end