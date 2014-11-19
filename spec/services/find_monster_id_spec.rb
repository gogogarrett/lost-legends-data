require 'rails_helper'

describe Service::FindMonsterId do
  let(:battle_id) { 1 }
  let(:battle) { double(monsters: [1]) }

  subject { Service::FindMonsterId.new(battle_id) }

  before do
    allow(Battle).to receive(:find).with(battle_id).and_return(battle)
  end

  it "return a random monster id" do
    expect(subject.call).to eq 1
  end
end
