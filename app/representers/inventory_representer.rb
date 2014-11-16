require 'representable/json'

module InventoryRepresenter
  include Representable::JSON

  property :id
  property :item_id, as: :item
  property :player
  property :item_type, as: :type

  def player
    super.id
  end
end
