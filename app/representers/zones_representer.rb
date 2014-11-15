require 'representable/json/collection'

module ZonesRepresenter
  include Representable::JSON::Collection

  items extend: ZoneRepresenter
end
