class CalculatePlayerHealth
  def initialize(player)
    @player = player
  end

  def health_progress
    (current_health / max_health * 100).floor
  end

  private

  attr_reader :player

  def current_health
    player.current_health
  end

  def max_health
    player.max_health
  end
end
