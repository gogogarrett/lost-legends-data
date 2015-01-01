module BuildAttackWonJson
  extend self
  def call(player, battle_level)
    {
      status: "won",
      exp: ::Service::RewardExp.new(player, battle_level).call,
      rubies: ::Service::RewardRubies.new(player, battle_level).call,
      items: [::Service::RewardItems.new(player, battle_level).call].compact,
    }
  end
end

module BuildAttackLostJson
  extend self
  def call
    {
      status: "fail",
      exp: nil,
      rubies: nil,
      items: nil,
    }
  end
end

module BuildAttackStartJson
  extend self
  def call
    {
      status: "in-progress",
      exp: nil,
      rubies: nil,
      items: nil,
    }
  end
end

class PlayerBattlePresenter < OpenStruct
  def initialize(model, json)
    super(model.as_json.merge(json))
  end
end

module Api
  module V1
    class PlayerBattlesController < ApplicationController
      respond_to :json

      def show
        player_battle = PlayerBattle.find(params[:id])
        player_battle_presenter = ::PlayerBattlePresenter.new(player_battle, BuildAttackStartJson.call)

        respond_with ::PlayerBattleRepresenter.prepare(player_battle_presenter).to_json(wrap: :player_battle)
      end

      def create
        monster_id = Service::FindMonsterId.new(player_battle_params[:battle_id]).call

        m = Monster.find(monster_id)
        # [g] clean this create up...please! factory/builder?
        create_hash = player_battle_params.merge(monster_id: monster_id, monster_health: m.health, level: 1)
        player_battle = PlayerBattle.create(create_hash)
        player_battle_presenter = ::PlayerBattlePresenter.new(player_battle, BuildAttackStartJson.call)

        render json: ::PlayerBattleRepresenter.prepare(player_battle_presenter).to_json(wrap: :player_battle)
      end

      def update
        player_battle = PlayerBattle.find(params[:id])
        player_damage = ::Service::PlayerDamange.new(player, player_battle.level).call
        attack_damage = ::Service::AttackDamange.new(player, player_battle.level).call

        new_monster_health = player_battle.monster_health - player_damage
        new_player_health = player.current_health - attack_damage

        attack_json = {}
        update_hash  = { monster_health: new_monster_health }

        if new_monster_health <= 0
          update_hash[:status] = "won"
          attack_json.merge! BuildAttackWonJson.call(player, player_battle.level)
        elsif new_player_health <= 0
          update_hash[:status] = "fail"
          attack_json.merge! BuildAttackLostJson.call
        end

        attack_json[:attack_damage] = attack_damage
        attack_json[:player_damage] = player_damage

        player_battle.update(update_hash)
        player_battle_presenter = ::PlayerBattlePresenter.new(player_battle, attack_json)

        render json: ::PlayerBattleRepresenter.prepare(player_battle_presenter).to_json(wrap: :player_battle)
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
