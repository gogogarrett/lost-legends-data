module Service
  class RewardItems

    def initialize(won, player, battle_level)
      @won, @player, @battle_level = won, player, battle_level
    end

    def call
      if won
        case battle_level
        when 1
          reward_random_weapon if random_number > 90
        when 2
          reward_random_weapon if random_number > 75
        when 3
          reward_random_weapon if random_number > 20
        else
          reward_random_weapon if random_number > 10
        end
      end
    end

    protected
    attr_reader :won, :player, :battle_level

    def random_number
      (1..100).to_a.sample
    end

    def reward_random_weapon
      [(1..6).to_a.sample]
    end

  end
end
