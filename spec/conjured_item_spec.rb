# frozen_string_literal: true

require 'conjured_item'

describe ConjuredItem do
  describe '#update_quality' do
    it 'quality degrades by 2 each day' do
      item = ConjuredItem.new('Conjured Muffin', 4, 6)
      item.update_quality
      expect(item.quality).to eq 4
    end
    it 'quality degrades by 4 each day past sell in date' do
      item = ConjuredItem.new('Conjured Muffin', -1, 6)
      item.update
      expect(item.quality).to eq 2
    end
  end
end
