require 'representable/json'

module ZoneRepresenter
  include Representable::JSON

  property :id
  property :title
  property :desc
  property :battle
  property :parent
  property :root
  collection :zones

  def battle
    !!super
  end
end
