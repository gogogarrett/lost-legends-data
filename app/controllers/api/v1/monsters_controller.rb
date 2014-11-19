module Api
  module V1
    class MonstersController < ApplicationController
      respond_to :json

      def index
        if params[:ids]
          monsters = params[:ids].map {|id| Monster.find(id) }
        else
          monsters = Monster.all
        end

        monsters_json = ::MonstersRepresenter.prepare(monsters).to_json(wrap: :monsters)

        respond_with monsters_json
      end

      def show
        monster = Monster.find(params[:id])
        monster_json = ::MonsterRepresenter.prepare(monster).to_json(wrap: :monster)

        respond_with monster_json
      end
    end
  end
end
