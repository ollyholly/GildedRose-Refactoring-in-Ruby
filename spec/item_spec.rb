# frozen_string_literal: true

require 'item'

describe Item do
  describe '#to_s' do
    it 'does not change the name' do
      # items = [Item.new('foo', 0, 0)]
      # GildedRose.new(items).update_quality
      # expect(items[0].name).to eq 'foo'
    end
  end
end
