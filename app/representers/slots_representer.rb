require 'representable/json/collection'

module SlotsRepresenter
  include Representable::JSON::Collection

  items extend: SlotRepresenter
end
