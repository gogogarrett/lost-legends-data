require 'representable/json'

module BattleRepresenter
  include Representable::JSON

  property :id
  property :level
  property :zone
  property :items
end
