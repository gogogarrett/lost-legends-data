require 'representable/json/collection'

module MonstersRepresenter
  include Representable::JSON::Collection

  items extend: MonsterRepresenter
end
