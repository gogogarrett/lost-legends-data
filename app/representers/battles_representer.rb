require 'representable/json/collection'

module BattlesRepresenter
  include Representable::JSON::Collection

  items extend: BattleRepresenter
end
