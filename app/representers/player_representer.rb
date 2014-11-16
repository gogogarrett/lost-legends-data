require 'representable/json'

module PlayerRepresenter
  include Representable::JSON

  property :id
  property :title
  property :exp
  property :hunts
  property :rubies

  property :slots, getter: -> (args) { represented.slots.map(&:id) }
  property :inventories, getter: -> (args) { represented.inventories.map(&:id) }
end
