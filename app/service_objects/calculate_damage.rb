class CalculateDamage
  ATTACKS = Attack::Base.descendants.freeze

  attr_reader :char_level, :weap_type

  def initialize(char_level, weap_type)
    @char_level = char_level
    @weap_type = weap_type
  end

  def calculate
    ATTACKS.map do |attack|
      DamageCalculator.new(character: character, weapon: weapon,attack: attack).damage
    end
  end

  private

  def character
    Character.new(char_level)
  end

  def weapon
    weap_type.constantize
  end
end