require 'pry'

module Killable
  def alive?
    self.health > 0
  end

  def dead?
    not self.alive?
  end
end

module Health_potion
  def regen_health
    if self.dead?
      self.health += 40
    end
  end
end

class Nord
  attr_reader :name
  attr_accessor :health, :level
  include Killable

  def initialize(name, level=1)
    @health_per_level ||= 10
    @damage_per_level ||= 2
    @level = level
    @name = name
    @health = level * @health_per_level
  end

  def max_damage
    @level * @damage_per_level
  end

  def damage
    rand(1..max_damage)
  end

  def attack(other)
    damage = self.damage
    other.health -= damage
    if damage > 10
      descriptor = "wallops"
    elsif damage > 3
      descriptor = "hits"
    else
      descriptor = "trips towards"
    end
    puts "#{self} #{descriptor} #{other} for #{damage} points of damage."
  end

  def to_s
    @name
  end
end

class Dremora_Lord
  attr_reader :level, :name
  attr_accessor :health
  include Killable

  def initialize(level)
    @level = level
    @name = "Dremora Lord (#{level})"
    @health = 0
    level.times { @health += rand(1..4) }
  end

  def attack(other)
    damage = rand(1..4) * @level
    puts "#{self} viciously assaults #{other} for #{damage} damage."
    other.health -= damage
  end

  def to_s
    @name
  end
end

class Draugr_Death_Overlord
  attr_reader :level, :name
  attr_accessor :health
  include Killable

  def initialize(level)
    @health_per_level = 6
    @level = level
    @name = "Draugr Death Overlord (#{level}"
    @health = level * @health_per_level
  end

  def dual_wield_attack(other)
    damage = rand(3..8) * @level
    puts "The Draugr Death Overlord impales #{other} with dual wielding Daedric Axes for #{damage} damage!"
    other.health -= damage
  end

  def to_s
    @name
  end
end

class Redguard < Nord
  def initialize(name, weapon, level=1)
    @weapon = weapon
    @damage_per_level = 4
    @health_per_level = 20
    super(name, level)
  end

  def savage_attack(other)
    puts "Beating #{other} senseless with a(n) #{@weapon}"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
  end
end

class Dragonborn < Nord #could this be Dragonbord < Redguard???
  include Health_potion
  def initialize(name, level=1)
    @damage_per_level = 20
    @health_per_level = 30
    super(name, level)
  end

  def call_dragon_attack(other)
    puts "#{self} calls a Dragon to the battlefield, #{other} doesn't stand much of a chance."
    num_attacks = (@level * 2) / 3
    num_attacks.times { self.attack(other)}
  end
end


binding.pry
