module Weapon
  class Mace < Base
    def self.min_dmg
      60
    end

    def self.max_dmg
      75
    end

    def self.element
      'cold'
    end

    def self.ele_mod
      1.10
    end

    def self.str_mod
      20
    end
  end
end
