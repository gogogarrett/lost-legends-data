module Workflow
  class CreateBattleResult

    def initialize(battle, player)
      @battle, @player = battle, player
    end

    def call
      # returns random elements so local var seems to do the trick
      @won = ::Service::CheckBattleResult.new(player, @battle).call

      build_result(@won, rubies, exp)
    end

    private
    attr_reader :battle, :player

    def rubies
      ::Service::RewardRubies.new(@won, player, battle.level).call
    end

    def exp
      ::Service::RewardExp.new(@won, player, battle.level).call
    end

    def items
      ::Service::RewardItems.new(@won, player, battle.level).call
    end

    def build_result(won, rubies, exp)
      OpenStruct.new(id: battle.id, zone: battle.zone, level: battle.level,
                     won: @won, exp: exp, rubies: rubies, items: items)
    end
  end
end
