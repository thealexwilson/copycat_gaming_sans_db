module Weapon
  class Axe < Base
    def self.min_dmg
      50
    end

    def self.max_dmg
      65
    end

    def self.element
      'fire'
    end

    def self.ele_mod
      1.10
    end

    def self.str_mod
      20
    end

    def self.speed
      1.2
    end
  end
end
