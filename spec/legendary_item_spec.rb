# frozen_string_literal: true

require 'legendary_item'
require 'gilded_rose'

describe LegendaryItem do
  describe '#update' do
    it 'sellin date of legendary item never changes' do
      item = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80)
      item.update
      expect(item.sell_in).to eq 0
    end
    it 'quality of legendary item never changes' do
      item = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80)
      item.update
      expect(item.quality).to eq 80
    end
  end
end
