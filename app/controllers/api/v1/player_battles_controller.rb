module Api
  module V1
    class PlayerBattlesController < ApplicationController
      respond_to :json

      def show
        player_battle = PlayerBattle.find(params[:id])
        player_battle_json = ::PlayerBattleRepresenter.prepare(player_battle).to_json(wrap: :player_battle, items: [])

        respond_with player_battle_json
      end

      def create
        monster_id = Service::FindMonsterId.new(player_battle_params[:battle_id]).call
        player_battle = PlayerBattle.create(player_battle_params.merge(monster_id: monster_id))

        player_battle_json = ::PlayerBattleRepresenter.prepare(player_battle).to_json(wrap: :player_battle, items: [])

        render json: player_battle_json
      end

      def update
        player_battle = PlayerBattle.find(params[:id])

        itemId = ::Service::RewardItems.new(player, player_battle.battle.level).call
        player_battle_params.delete(:monster)
        player_battle_params.delete(:items)
        player_battle.update(player_battle_params)
        player_battle_json = ::PlayerBattleRepresenter.prepare(player_battle).to_json(wrap: :player_battle, items: [itemId])

        render json: player_battle_json
      end

      def destroy
        player_battle = PlayerBattle.find(params[:id])
        player_battle.destroy
        head 200
      end

      private

      def player
        @player ||= Player.find(1)
      end

      def player_battle_params
        # [g] gross..
        if params[:playerBattle].present?
          params.require(:playerBattle).permit(:status, :player_id, :battle_id)
        else
          params.require(:player_battle).permit(:status, :player_id, :battle_id)
        end
      end
    end
  end
end
