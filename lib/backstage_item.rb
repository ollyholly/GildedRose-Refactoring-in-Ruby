# frozen_string_literal: true

require_relative 'aged_item'

class BackstageItem < AgedItem
  def accelerate
    self.quality += 1 if sell_in <= 10
    self.quality += 1 if sell_in <= 5
  end

  def drop_quality
    super
    self.quality = 0 if sell_in < 0
  end
end
