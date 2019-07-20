class DamageCalculator
  attr_reader :character, :weapon, :attack

  def initialize(character:, weapon:, attack:)
    @character = character
    @weapon = weapon
    @attack = attack
  end

  def damage
    { name: attack.name.demodulize, min_dmg: min_dmg, max_dmg: max_dmg, dps: dps }
  end

  private

  def min_dmg
    (base_min_damage * char_damage_per * ele_mod).round(2)
  end

  def max_dmg
    (base_max_damage * char_damage_per * ele_mod).round(2)
  end

  def dps
    (avg_dmg * speed).round(3)
  end

  def base_min_damage
    weapon.min_dmg * @attack.damage
  end

  def base_max_damage
    weapon.max_dmg * @attack.damage
  end

  def char_damage_per
    (character.strength + weapon.str_mod).to_f / 100
  end

  def ele_mod
    return 1 unless @attack.type == weapon.element
    weapon.ele_mod
  end

  def avg_dmg
    (min_dmg + max_dmg).to_f / 2
  end

  def speed
    @attack.speed * weapon.speed
  end
end