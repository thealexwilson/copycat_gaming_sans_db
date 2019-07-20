class Character
  attr_reader :level

  def initialize(level)
    @level = level
  end

  def vitality
    level * 5
  end

  def strength
    level * 10
  end
end
