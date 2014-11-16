class Slot < ActiveRecord::Base
  belongs_to :player

  def item
    Item.find(item_id)
  end
end
