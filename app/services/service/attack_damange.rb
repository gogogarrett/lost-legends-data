module Service
  class AttackDamange
    def initialize(monster, battle_level)
      @monster, @battle_level = monster, battle_level
    end

    def call
      monster_level + random_number
    end

    private

    def random_number
      (1..2).to_a.sample
    end

    attr_reader :monster, :battle_level

    def monster_level
      monster.level
    end
  end
end
