module Service
  class RewardBase

    def initialize(won, player, battle_level)
      @won, @player, @battle_level = won, player, battle_level
    end

    def call
      if won
        case battle_level
        when 1
          smallest_array.sample + (player_level * 2)
        when 2
          smaller_array.sample + (player_level * 2)
        when 3
          small_array.sample + (player_level * 2)
        else
          big_array.sample + (player_level * 2)
        end
      end
    end

    protected
    attr_reader :won, :player, :battle_level

    def smallest_array
      (10..20).to_a
    end

    def smaller_array
      (21..50).to_a
    end

    def small_array
      (51..100).to_a
    end

    def big_array
      (101..1000).to_a
    end

    def player_level
      player.level
    end
  end
end
