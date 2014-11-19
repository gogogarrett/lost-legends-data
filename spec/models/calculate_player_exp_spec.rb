require 'spec_helper'
require_relative "../../app/models/calculate_exp"
require_relative "../../app/models/calculate_player_exp"

describe CalculatePlayerExp do
  subject { CalculatePlayerExp.new(player) }

  context "level 1 - no exp" do
    let(:player) { double(level: 1, exp: 0) }

    it "calcs exp_percent for a given player (for a level)" do
      expect(subject.exp_percent).to eq 0
    end
  end

  context "level 1 - some exp" do
    let(:player) { double(level: 1, exp: 100) }

    it "calcs exp_percent for a given player (for a level)" do
      # 100 / 150 * 100
      expect(subject.exp_percent).to eq 66
    end
  end

  context "level 100 - lots of exp" do
    let(:player) { double(level: 100, exp: 16_20) }

    it "calcs exp_percent for a given player (for a level)" do
      expect(subject.exp_percent).to eq 84
    end
  end
end
