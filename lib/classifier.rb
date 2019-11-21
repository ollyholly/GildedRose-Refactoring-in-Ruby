# frozen_string_literal: true
require_relative 'item'
require_relative 'regular_item'
require_relative 'legendary_item'
require_relative 'aged_item'
require_relative 'backstage_item'
require_relative 'conjured_item'

class Classifier

  TYPES = {
    "Aged": AgedItem,
    "Sulfuras, Hand of Ragnaros": LegendaryItem,
    "Conjured": ConjuredItem,
    "Backstage": BackstageItem
  }

  def sort_classes(items)
    sorted_items = []
    items.each do |item|
      TYPES.each_key do |type|
        if item.name.include?(type.to_s)
          sorted_items << TYPES[type].new(item.name, item.sell_in, item.quality)
        end
      end
      sorted_items << RegularItem.new(item.name, item.sell_in, item.quality)
    end
    sorted_items
  end
end
