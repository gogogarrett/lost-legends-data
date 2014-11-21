module Service
  class PlayerDamange
    def initialize(player, battle_level)
      @player, @battle_level = player, battle_level
    end

    def call
      player_level + random_number
    end

    private

    def random_number
      (1..15).to_a.sample
    end

    attr_reader :player, :battle_level

    def player_level
      player.level
    end
  end
end
