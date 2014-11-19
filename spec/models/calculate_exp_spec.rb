require 'spec_helper'
require_relative "../../app/models/calculate_exp"

describe CalculateExp do
  subject { CalculateExp }

  # Testing the Runescape level alg: ( level + 300 * 2^(level / 7) ).div(4)
  it 'works! - basic high level santity test' do
    expect(subject.exp(1)).to eq 150
    expect(subject.cumulative_exp(1)).to eq 150

    expect(subject.exp(50)).to eq 163
    expect(subject.cumulative_exp(50)).to eq 7_799

    expect(subject.exp(100)).to eq 172
    expect(subject.cumulative_exp(100)).to eq 16_226

    expect(subject.exp(1_000)).to eq 435
    expect(subject.cumulative_exp(1_000)).to eq 276_121
  end

  it "#exp(level)" do
    expect(subject.exp(1)).to eq 150
  end

  it "#cumulative_exp(level)" do
    expect(subject.exp(1)).to eq 150
    expect(subject.exp(2)).to eq 150

    expect(subject.cumulative_exp(2)).to eq 300
  end
end
