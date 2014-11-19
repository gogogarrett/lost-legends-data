class PlayerBattle < ActiveRecord::Base
  belongs_to :player

  def monster
    Monster.find(monster_id)
  end

  def battle
    Battle.find(battle_id)
  end
end
