require 'representable/json/collection'

module InventoriesRepresenter
  include Representable::JSON::Collection

  items extend: InventoryRepresenter
end
