module Service
  class CheckBattleResult

    def initialize(player, battle_level)
      @player, @battle_level = player, battle_level
    end

    def call
      if good_odds?
        check_luckliness(5 + player_level)
      else
        check_luckliness(1 + player_level)
      end
    end

    private
    attr_reader :player, :battle_level

    def good_odds?
      player_level >= battle_level
    end

    def check_luckliness(win_chances)
      odds = []
      battle_level.times { odds << false }
      win_chances.times { odds << true }
      odds.sample
    end

    def player_level
      player.level
    end
  end
end
