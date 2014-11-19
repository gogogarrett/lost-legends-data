require 'spec_helper'
require_relative "../../app/services/service/check_battle_result"

describe Service::CheckBattleResult do
  let(:player) { double(level: 1) }
  let(:battle_level) { 2 }

  subject { Service::CheckBattleResult.new(player, battle_level) }

  # [g] less than ideal
  it "should be truthy" do
    expect(subject.call).to_not eq nil
  end
end
