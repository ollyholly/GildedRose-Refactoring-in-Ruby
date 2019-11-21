# frozen_string_literal: true

require 'backstage_item'

describe BackstageItem do
  describe '#update_quality' do
    
    it 'Backstage item increases in quality by 2 when there are 10 days or less' do
      item = BackstageItem.new('Backstage passes to a TAFKAL80ETC show', 9, 20)
      item.update_quality
      expect(item.quality).to eq 22
    end
    
    it 'ackstage item increases in quality by 3 when there are 5 days or less' do
      item = BackstageItem.new('Backstage passes to a TAFKAL80ETC show', 5, 20)
      item.update_quality
      expect(item.quality).to eq 23
    end

    it 'Backstage item quality drops to 0 after the concert' do
      item = BackstageItem.new('Backstage passes to a TAFKAL80ETC show', 0, 20)
      item.update_sell_in
      item.update_quality
      expect(item.quality).to eq 0
    end

  end
end

