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
  }.freeze

  def sort_classes(items)
    sorted_items = []
    items.each do |item|
      klass = fetch_class(item)
      sorted_items << klass.new(item.name, item.sell_in, item.quality)
    end
    sorted_items
  end

  private

  def fetch_class(item)
    TYPES.each_key do |type|
      return TYPES[type] if item.name.include?(type.to_s)
    end
    RegularItem
  end
end
