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
        # [g] move me
        player.update(player_params)
        if player.exp > CalculateExp.cumulative_exp(player.level)
          player.increment(:level).save
        end
        player_json = ::PlayerRepresenter.prepare(player).to_json(wrap: :player)

        render json: player_json
      end

      private
      def player_params
        # [g] super secure
        params.require(:player).permit(:title, :hunts, :rubies, :spending_points, :exp, :muscle, :intellect, :defense)
      end
    end
  end
end
