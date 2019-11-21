# frozen_string_literal: true

require_relative 'item'

class RegularItem < Item
  def update
    update_quality
    update_sell_in
    update_quality if sell_in < 0
  end

  def update_quality
    self.quality -= 1 if quality > 0
  end

  def update_sell_in
    self.sell_in -= 1
  end
end
