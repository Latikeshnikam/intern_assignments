#!/usr/bin/ruby2.5

module SuperPower

  def can_run
    puts  "Your Superhero can run"
  end

  def can_fly
    puts "Your Superhero can fly"
  end

  def can_jump
    puts "Your Superhero can jump"
  end

  def method_missing(symb,*args)
    puts "No #{symb} superpower"
  end

  module_function :can_run, :can_fly, :can_jump
end


class SuperHero
  include SuperPower
  
  @@superhero_power = {
   "flash" => "can_run",
    "shaktiman" => "can_jump",
    "spiderman"  => "can_jump"
  }

  def initialize(name_of_hero)
    @name_of_hero = name_of_hero
  end

  def power
   a =  @@superhero_power[@name_of_hero]
   
   if a == "can_run"
     can_run
   elsif a == "can_jump"
     can_jump
   else
     can_fly
   end

  end

end

SuperHero.new("flash").power
SuperHero.new("shaktiman").power
SuperHero.new("spiderman").power
