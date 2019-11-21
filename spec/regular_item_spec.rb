# frozen_string_literal: true
require 'regular_item'

describe RegularItem do

  describe '#update' do
    it 'each day reduce the quality & sellin date by 1' do
      item = RegularItem.new('Elixir of the Mongoose', 4, 6)
      item.update
      expect(item.quality).to eq 5
      expect(item.sell_in).to eq 3
    end

    it 'quality of an item is never negative' do
      item = RegularItem.new('Elixir of the Mongoose', 4, 0)
      item.update
      expect(item.quality).to eq 0
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      item = RegularItem.new('Elixir of the Mongoose', -1, 8)
      item.update
      expect(item.quality).to eq 6
    end
  end

  describe '#update_quality' do
    it 'reduce the quality by 1 each day' do
      item = RegularItem.new('Elixir of the Mongoose', 4, 6)
      item.update_quality
      expect(item.quality).to eq 5
    end
  end

  describe '#update_sell_in' do
    it 'reduce the quality by 1 each day' do
      item = RegularItem.new('Elixir of the Mongoose', 4, 6)
      item.update_sell_in
      expect(item.sell_in).to eq 3
    end
  end
end
