require 'representable/json'

module MonsterRepresenter
  include Representable::JSON

  property :id
  property :title
  property :desc
end
