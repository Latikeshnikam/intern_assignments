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

  def flash_power
    can_run
  end

  def shaktiman_power
    can_fly
  end

  def spiderman_power
    can_jump
  end

end

flash = SuperHero.new
flash.flash_power
flash.can_jump
