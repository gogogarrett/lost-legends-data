module Api
  module V1
    class InventoriesController < ApplicationController
      respond_to :json

      def index
        if params[:ids]
          inventories = params[:ids].map {|id| Inventory.find(id) }#.map(&:item).flatten
        else
          inventories = Inventory.where(player_id: player.id)#.map(&:item).flatten
        end

        inventories_json = ::InventoriesRepresenter.prepare(inventories).to_json(wrap: :inventories)
        respond_with inventories_json
      end

      def show
        inventory = Inventory.find(params[:id])
        inventory_json = ::InventoryRepresenter.prepare(inventory).to_json(wrap: :inventory)

        respond_with inventory_json
      end

      def create
        inventory = Inventory.create(inventory_params)
        inventory_json = ::InventoryRepresenter.prepare(inventory).to_json(wrap: :inventory)

        render json: inventory_json
      end

      def update
        inventory = Inventory.find(params[:id])
        inventory.update(params[:inventory])
        inventory_json = ::InventoryRepresenter.prepare(inventory).to_json(wrap: :inventory)

        respond_with inventory_json
      end

      def destroy
        inventory = Inventory.find(params[:id])
        inventory.destroy
        head 200
      end

      private
      def inventory_params
        params.require(:inventory).permit!
      end

      def player
        @player ||= Player.find(1)
      end
    end
  end
end
