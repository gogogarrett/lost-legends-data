module Api
  module V1
    class PlayersController < ApplicationController
      respond_to :json

      def show
        player = Player.find(params[:id])
        player_json = ::PlayerRepresenter.prepare(player).to_json(wrap: :player)

        respond_with player_json
      end

      def update
        player = Player.find(params[:id])
        player.update(player_params)
        player_json = ::PlayerRepresenter.prepare(player).to_json(wrap: :player)

        respond_with player_json
      end

      private
      def player_params
        # [g] super secure
        params.require(:player).permit!
      end
    end
  end
end
