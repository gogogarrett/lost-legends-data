require 'representable/json'

module BattleRepresenter
  include Representable::JSON

  property :id
  property :win
  property :exp
  property :rubies
  property :level
  property :zone
  property :items

  def win
    represented.won
  end
end
