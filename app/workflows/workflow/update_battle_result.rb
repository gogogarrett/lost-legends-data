module Workflow
  class UpdateBattleResult

    def initialize(player_battle, player, params)
      @player_battle, @player, @params = player_battle, player, params
    end

    def call
      @won = ::Service::CheckBattleResult.new(player, battle).call
      player_battle.update(@params)
      build_result(@won, rubies, exp)
    end

    private
    attr_reader :player_battle, :player

    def rubies
      ::Service::RewardRubies.new(player, battle_level).call if @won
    end

    def exp
      ::Service::RewardExp.new(player, battle_level).call if @won
    end

    def items
      ::Service::RewardItems.new(player, battle_level).call if @won
    end

    def build_result(won, rubies, exp)
      OpenStruct.new(id: battle.id, zone: battle.zone, level: battle_level,
                     won: @won, exp: exp, rubies: rubies, items: items)
    end

    def battle
      player_battle.battle
    end

    def battle_level
      battle.level
    end
  end
end
