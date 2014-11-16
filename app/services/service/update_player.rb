module Service
  class UpdatePlayer

    def initialize(player, params)
      @player = player
      @item_params = params.delete(:items)
      @player_params = params
    end

    def call
      player.update(player_params)

      if item_params.present?
        item_params.each do |item_id|
          item = Item.find(item_id)
          player.inventories.create!(item_id: item_id, item_type: item.type) unless item_ids.include?(item_id.to_i)
        end
      end
      player
    end

    private
    attr_reader :item_params, :player_params, :player

    def item_ids
      player.items.map(&:id)
    end
  end
end
