# frozen_string_literal: true

require 'classifier'

describe Classifier do
  subject(:classifier) { described_class.new }

  describe '#sort_classes' do
    it 'Aged Brie is identified as Aged Item' do
      item = Item.new('Aged Brie', 2, 0)
      expect(classifier.sort_classes([item])[0]).to be_an_instance_of(AgedItem)
      expect(classifier.sort_classes([item])[0].name).to eq item.name
      expect(classifier.sort_classes([item])[0].sell_in).to eq item.sell_in
      expect(classifier.sort_classes([item])[0].quality).to eq item.quality
    end

    it 'Sulfuras, Hand of Ragnaros is identified as Legendary Item' do
      item = Item.new('Sulfuras, Hand of Ragnaros', -1, 80)
      expect(classifier.sort_classes([item])[0]).to be_an_instance_of(LegendaryItem)
      expect(classifier.sort_classes([item])[0].name).to eq item.name
      expect(classifier.sort_classes([item])[0].sell_in).to eq item.sell_in
      expect(classifier.sort_classes([item])[0].quality).to eq item.quality
    end

    it 'Conjured Mana Cake is identified as Conjured Item' do
      item = Item.new('Conjured Mana Cake', 3, 6)
      expect(classifier.sort_classes([item])[0]).to be_an_instance_of(ConjuredItem)
      expect(classifier.sort_classes([item])[0].name).to eq item.name
      expect(classifier.sort_classes([item])[0].sell_in).to eq item.sell_in
      expect(classifier.sort_classes([item])[0].quality).to eq item.quality
    end

    it 'Backstage passes to a TAFKAL80ETC show is identified as Backstage Item' do
      item = Item.new('Backstage passes to a TAFKAL80ETC show', 15, 20)
      expect(classifier.sort_classes([item])[0]).to be_an_instance_of(BackstageItem)
      expect(classifier.sort_classes([item])[0].name).to eq item.name
      expect(classifier.sort_classes([item])[0].sell_in).to eq item.sell_in
      expect(classifier.sort_classes([item])[0].quality).to eq item.quality
    end

    it '+5 Dexterity Vest is identified as Regular Item' do
      item = Item.new('+5 Dexterity Vest', 10, 20)
      expect(classifier.sort_classes([item])[0]).to be_an_instance_of(RegularItem)
      expect(classifier.sort_classes([item])[0].name).to eq item.name
      expect(classifier.sort_classes([item])[0].sell_in).to eq item.sell_in
      expect(classifier.sort_classes([item])[0].quality).to eq item.quality
    end
  end
end
