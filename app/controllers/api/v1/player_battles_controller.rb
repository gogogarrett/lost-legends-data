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

        m = Monster.find(monster_id)
        create_hash = player_battle_params.merge(monster_id: monster_id, monster_health: m.health)
        player_battle = PlayerBattle.create(create_hash)

        player_battle_json = ::PlayerBattleRepresenter.prepare(player_battle).to_json(wrap: :player_battle)

        render json: player_battle_json
      end

      def update
        player_battle = PlayerBattle.find(params[:id])
        new_health = player_battle.monster_health - 10

        update_hash  = { monster_health: new_health }

        # [g] super super gross.
        if new_health <= 0
          battle = player_battle.battle
          update_hash[:status] = "won"

          data = {}
          data[:exp] = ::Service::RewardExp.new(player, battle.level).call
          data[:items] = [::Service::RewardItems.new(player, battle.level).call].compact
          data[:rubies] = ::Service::RewardRubies.new(player, battle.level).call
        end

        player_battle.update(update_hash)

        player_battle_json = ::PlayerBattleRepresenter.prepare(player_battle).to_json(wrap: :player_battle, data: data)
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
