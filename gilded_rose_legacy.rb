# frozen_string_literal: true

require_relative 'item'
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # +++++++QUALITY UPDATE++++++++
      # SORTING REGULAR ITEMS
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        if item.quality > 0
          item.quality = item.quality - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
        end
      else
        # SORTING BRIE AND PASS
        if item.quality < 50
          # SORTING BRIE
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            # SORTING PASSES
            if item.sell_in < 11
              item.quality = item.quality + 1 if item.quality < 50
            end
            if item.sell_in < 6
              item.quality = item.quality + 1 if item.quality < 50
            end
          end
        end
      end
      #++++++SELLIN UPDATE++++++
      # REGULAR SELLIN UPDATE
      item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
      # OVERDUE SELLIN UPDATE
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                # REGULAR ADDITIONAL QUALITY DECREASE
                item.quality = item.quality - 1
              end
            end
          else
            # PASSES OVERDUE QUALITY DECREASE TO ZERO
            item.quality = item.quality - item.quality
          end
        else
          # BRIE QUALITY UPDATE
          item.quality = item.quality + 1 if item.quality < 50
        end
      end
    end
  end
end
