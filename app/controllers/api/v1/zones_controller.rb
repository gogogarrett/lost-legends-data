module Api
  module V1
    class ZonesController < ApplicationController
      respond_to :json

      def index
        if params[:ids]
          zones = params[:ids].map {|id| Zone.find(id) }
        else
          zones = Zone.all
        end

        zones_json = ::ZonesRepresenter.prepare(zones).to_json(wrap: :zones)

        respond_with zones_json
      end

      def show
        zone = Zone.find(params[:id])
        zone_json = ::ZoneRepresenter.prepare(zone).to_json(wrap: :zone)

        respond_with zone_json
      end
    end
  end
end
