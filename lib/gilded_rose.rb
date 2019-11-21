# frozen_string_literal: true
require_relative 'classifier'
require_relative 'item'

class GildedRose
  attr_accessor :classifier, :items

  def initialize(items, classifier = Classifier.new)
    @items = items
    @classifier = classifier
  end

  def update_quality
    sorted_items = classifier.sort_classes(@items)
    sorted_items.each do |item|
      item.update
    end
    self.items = sorted_items
  end
end
