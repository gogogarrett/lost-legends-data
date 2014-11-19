require 'spec_helper'
require_relative "../../app/services/service/reward_base"

describe Service::RewardBase do
  let(:player) { double }
  let(:battle_level) { 2 }

  subject { Service::RewardBase.new(player, battle_level) }

  it 'returns a random value depending on battle level' do
    expect(subject.call).to_not eq nil
    expect(subject.call.class).to eq Fixnum
  end
end
