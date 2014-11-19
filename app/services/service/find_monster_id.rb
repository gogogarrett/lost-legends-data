module Service
  class FindMonsterId

    def initialize(battle_id)
      @battle = Battle.find(battle_id)
    end

    def call
      battle.monsters.sample
    end

    private
    attr_reader :battle
  end
end
