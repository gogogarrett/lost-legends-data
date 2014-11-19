require 'rails_helper'

describe Player do
  it "#items" do
    expect(subject.items).to eq []
  end

  it "#equipped_items" do
    expect(subject.equipped_items).to eq []
  end

  context "with items" do
    let(:inventory) { double(item_id: 1, item_type: 'Weapon') }
    let(:slot) { double(item_id: 2, item_type: 'Armor') }

    before do
      allow(subject).to receive(:inventories).and_return([inventory])
      allow(subject).to receive(:slots).and_return([slot])
    end

    it "#items" do
      expect(Item).to receive(:find).with(inventory.item_id)
      subject.items
    end

    it "#equipped_items" do
      expect(Item).to receive(:find).with(slot.item_id)
      subject.equipped_items
    end
  end
end
