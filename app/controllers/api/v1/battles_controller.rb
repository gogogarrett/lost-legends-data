module Api
  module V1
    class BattlesController < ApplicationController
      respond_to :json

      def show
        battle = Battle.find(params[:id])
        battle_result = ::Workflow::CreateBattleResult.new(battle, player).call
        battle_json = ::BattleRepresenter.prepare(battle_result).to_json(wrap: :battle)

        respond_with battle_json
      end

      private
      def player
        @player ||= Player.find(1)
      end
    end
  end
end
