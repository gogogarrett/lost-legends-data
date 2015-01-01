require "representable/json"

module PlayerBattleRepresenter
  include Representable::JSON

  property :id
  property :monster_id, as: :monster
  property :player_id, as: :player
  property :status
  property :zone
  property :monster_health

  property :exp
  property :items
  property :rubies
  property :attack_damage
  property :player_damage

  # [g] fix this
  def zone
    battle.zone rescue 6
  end
end
