module Service
  class RewardBase

    def initialize(player, battle_level)
      @player, @battle_level = player, battle_level
    end

    def call
      case battle_level
      when 1
        smallest_array.sample
      when 2
        smaller_array.sample
      when 3
        small_array.sample
      else
        big_array.sample
      end
    end

    private
    attr_reader :player, :battle_level

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
  end
end
