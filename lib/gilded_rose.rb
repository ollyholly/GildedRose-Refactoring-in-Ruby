# frozen_string_literal: true

require_relative 'classifier'
require_relative 'item'

class GildedRose
  attr_reader :classifier, :items

  def initialize(items, classifier = Classifier.new)
    @items = items
    @classifier = classifier
    @sorted_items = []
  end

  def update_quality
    @sorted_items = classifier.sort_classes(@items)
    @sorted_items.each(&:update)
    update_originals
  end

  private

  def update_originals
    @items.each.with_index do |item, index|
      item.name = @sorted_items[index].name
      item.sell_in = @sorted_items[index].sell_in
      item.quality = @sorted_items[index].quality
    end
  end
end
