module Api
  module V1
    class SlotsController < ApplicationController
      respond_to :json

      def index
        if params[:ids]
          slots = params[:ids].map {|id| Slot.find(id) }
        else
          slots = Slot.all
        end

        slots_json = ::SlotsRepresenter.prepare(slots).to_json(wrap: :slots)

        respond_with slots_json
      end

      def show
        slot = Slot.find(params[:id])
        slot_json = ::SlotRepresenter.prepare(slot).to_json(wrap: :slot)

        respond_with slot_json
      end

      def create
        slot = Slot.create(slot_params)
        slot_json = ::SlotRepresenter.prepare(slot).to_json(wrap: :slot)

        render json: slot_json
      end


      def update
        slot = Slot.find(params[:id])
        slot.update(params[:slot])
        slot_json = ::SlotRepresenter.prepare(slot).to_json(wrap: :slot)

        respond_with slot_json
      end

      private
      def slot_params
        params.require(:slot).permit!
      end
    end
  end
end
