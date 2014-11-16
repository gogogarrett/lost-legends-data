require 'representable/json'

module PlayerRepresenter
  include Representable::JSON

  property :id
  property :title
  property :exp
  property :hunts
  property :rubies

  property :items, getter:          -> (args) { represented.items.map(&:id) }
  property :equipped_items, getter: -> (args) { represented.equipped_items.map(&:id) }
end
