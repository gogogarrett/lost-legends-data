require 'representable/json'

module PlayerBattleRepresenter
  include Representable::JSON

  property :id
  property :monster_id, as: :monster
  property :player_id, as: :player
  property :exp
  property :rubies
  property :status
  property :zone

  # property :items
  property :items, getter: -> (args) {
    if items = args[:items]
      items unless items.any?(&:nil?)
    else
      items = represented.items
      items unless items.any?(&:nil?)
    end
  }

  def zone
    battle.zone
  end

  def rubies
    ::Service::RewardRubies.new(Player.find(1), 1).call if status == "won"
  end

  def exp
    ::Service::RewardExp.new(Player.find(1), 1).call if status == "won"
  end
end
