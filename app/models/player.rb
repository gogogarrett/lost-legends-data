class Player < ActiveRecord::Base
  has_many :slots
  has_many :inventories

  def items
    inventories.map(&:item_id).map do |item_id|
      Item.find(item_id)
    end
  end

  def equipped_items
    slots.map(&:item_id).map do |item_id|
      Item.find(item_id)
    end
  end
end
