require "representable/json"

module PlayerBattleRepresenter
  include Representable::JSON

  property :id
  property :monster_id, as: :monster
  property :player_id, as: :player

  # [g] these are gross. wrap in an OpenStruct before here..?
  property :exp, getter: -> (args) do
    args[:data][:exp] if args[:data] && args[:data][:exp]
  end
  property :items, getter: -> (args) do
    args[:data][:items] if args[:data] && args[:data][:items]
  end
  property :rubies, getter: -> (args) do
    args[:data][:rubies] if args[:data] && args[:data][:rubies]
  end

  property :status
  property :zone
  property :monster_health

  property :attack_damage, getter: -> (args) { 1 }
  property :player_damage, getter: -> (args) { 10 }

  def zone
    battle.zone
  end
end
