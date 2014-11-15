require 'representable/json/collection'

module ItemsRepresenter
  include Representable::JSON::Collection

  items extend: ItemRepresenter
end
