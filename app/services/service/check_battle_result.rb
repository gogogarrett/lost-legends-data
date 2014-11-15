module Service
  class CheckBattleResult

    def initialize(player, battle)
      @player, @battle = player, battle
    end

    def call
      if player_level >= battle_level
        check_luckliness(5 + player_level)
      else
        check_luckliness(1 + player_level)
      end
    end

    private
    attr_reader :player, :battle

    def check_luckliness(win_chances)
      odds = []
      battle_level.times { odds << false }
      win_chances.times { odds << true }
      odds.sample
    end

    def player_level
      player.level
    end

    def battle_level
      battle.level
    end
  end
end
