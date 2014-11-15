require 'representable/json'

module SlotRepresenter
  include Representable::JSON

  property :id
  property :item
  property :player
  property :type
end
