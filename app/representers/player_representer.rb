require 'representable/json'

module PlayerRepresenter
  include Representable::JSON

  property :id
  property :title
  property :hunts
  property :rubies

  property :max_health
  property :current_health
  property :health_progress, getter: -> (args) { CalculatePlayerHealth.new(self).health_progress }

  property :muscle
  property :intellect
  property :defense
  property :spending_points

  property :slots, getter: -> (args) { represented.slots.map(&:id) }
  property :inventories, getter: -> (args) { represented.inventories.map(&:id) }

  property :exp
  property :level

  property :level_progress, getter: -> (args) { CalculatePlayerExp.new(self).exp_percent }
end
