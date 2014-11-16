require 'representable/json'

module PlayerRepresenter
  include Representable::JSON

  property :id
  property :title
  property :exp
  property :hunts
  property :rubies

  property :items, getter: -> (args) { represented.items.map(&:id) }
  property :slots, getter: -> (args) { represented.slots.map(&:id) }
end
