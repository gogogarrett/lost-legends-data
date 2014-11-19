class CalculatePlayerExp
  include CalculateExp

  def initialize(player)
    @player = player
  end

  def exp_percent
    (exp_into_current_level / exp(player_level) * 100).floor
  end

  private
  attr_reader :player

  def exp_into_current_level
    player_exp.to_f - cumulative_exp(player_level - 1).to_f
  end

  def player_level
    player.level
  end

  def player_exp
    player.exp
  end
end
