require 'representable/json'

module PlayerRepresenter
  include Representable::JSON

  property :id
  property :title
  property :exp
  property :hunts
  property :rubies
  collection :items
  collection :slots
end
