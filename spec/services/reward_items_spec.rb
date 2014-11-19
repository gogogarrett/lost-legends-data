# [g] make this not rails_helper..
require 'rails_helper'

describe Service::RewardItems do
  let(:items) { [OpenStruct.new(id: 1)] }
  let(:player) { double(items: items) }
  let(:battle_level) { 2 }

  subject { Service::RewardItems.new(player, battle_level) }

  before do
    allow(subject).to receive(:should_reward?).and_return(true)
  end

  it 'returns a random value depending on battle level' do
    expect(subject.call).to_not eq nil
    expect(subject.call.class).to eq Fixnum
  end

  context "unlucky" do
    before do
      allow(subject).to receive(:should_reward?).and_return(false)
    end

    it 'returns a random value depending on battle level' do
      expect(subject.call).to eq nil
    end
  end
end
