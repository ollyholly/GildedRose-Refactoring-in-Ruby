#!/usr/bin/ruby -w
# frozen_string_literal: true

require_relative '../gilded_rose'

items = [
  Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
  Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
  Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
  Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
  Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
  # This Conjured item does not work properly yet
  Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6) # <-- :O
]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

file = File.open('./lib/approval/CurrentFile.txt', 'w')
gilded_rose = GildedRose.new items
(0...days).each do |day|
  file.puts "-------- day #{day} --------"
  file.puts 'name, sellIn, quality'
  items.each do |item|
    file.puts item
  end
  file.puts ''
  gilded_rose.update_quality
end
file.close
