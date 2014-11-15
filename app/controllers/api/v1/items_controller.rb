module Api
  module V1
    class ItemsController < ApplicationController
      respond_to :json

      def index
        if params[:ids]
          items = params[:ids].map {|id| Item.find(id) }
        else
          items = Item.all
        end

        items_json = ::ItemsRepresenter.prepare(items).to_json(wrap: :items)

        respond_with items_json
      end

      def show
        item = Item.find(params[:id])
        item_json = ::ItemRepresenter.prepare(item).to_json(wrap: :item)

        respond_with item_json
      end
    end
  end
end
