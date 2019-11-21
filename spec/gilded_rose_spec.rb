# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    # - All items have a SellIn value which denotes the number of days we have to sell the item
    # - All items have a Quality value which denotes how valuable the item is
    # - At the end of each day our system lowers both values for every item

    # - Once the sell by date has passed, Quality degrades twice as fast
    # - The Quality of an item is never more than 50

    context 'All items' do
      it 'At the end of each day SellIn decreases by 1' do
        items = [Item.new('Elixir of the Mongoose', 4, 6)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 3
      end
      it 'At the end of each day Quality decreases by 1' do
        items = [Item.new('Elixir of the Mongoose', 4, 6)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 5
      end

      it 'The Quality of an item is never negative' do
        items = [Item.new('Elixir of the Mongoose', 4, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'The Quality of an item is never more than 50' do
        items = [Item.new('Elixir of the Mongoose', 4, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'Once the sell by date has passed, Quality degrades twice as fast' do
        items = [Item.new('Elixir of the Mongoose', -1, 8)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 6
      end
    end

    context 'Sulfurus' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality

      it 'Sellin date of Sulfuras never changes' do
        expect(items[0].sell_in).to eq 0
      end

      it 'Quality of Sulfuras never decreases' do
        expect(items[0].quality).to eq 80
      end
    end

    context 'Aged Brie' do
      it 'Aged Brie increases in Quality the older it gets' do
        items = [Item.new('Aged Brie', 2, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 1
        expect(items[0].sell_in).to eq 1
      end

      it 'Aged Brie increases in Quality even after the SellIn date' do
        items = [Item.new('Aged Brie', -1, 2)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 4
        expect(items[0].sell_in).to eq(-2)
      end

      it 'The Quality of an item is never more than 50' do
        items = [Item.new('Aged Brie', 2, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'Backstage passes increases in Quality as its SellIn value approaches' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 21
        expect(items[0].sell_in).to eq 14
      end

      it 'Backstage passes increases in Quality by 2 when there are 10 days or less' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 22
        expect(items[0].sell_in).to eq 8
      end

      it 'Backstage passes increases in Quality by 3 when there are 5 days or less' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 23
        expect(items[0].sell_in).to eq 4
      end

      it 'The Quality of an item is never more than 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'Quality drops to 0 after the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end
    end
  end
end
