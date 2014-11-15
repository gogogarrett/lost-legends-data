require 'representable/json'

module ItemRepresenter
  include Representable::JSON

  property :id
  property :title
  property :type
end
