# frozen_string_literal: true

require 'aged_item'

describe AgedItem do
  describe '#update_quality' do
    it 'increase the quality by 1 each day' do
      item = AgedItem.new('Aged Brie', 4, 6)
      item.update_quality
      expect(item.quality).to eq 7
    end
  end
end
