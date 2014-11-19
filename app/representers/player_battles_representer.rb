require 'representable/json/collection'

module PlayerBattlesRepresenter
  include Representable::JSON::Collection

  items extend: PlayerBattleRepresenter
end
