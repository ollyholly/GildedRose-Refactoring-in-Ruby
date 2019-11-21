# frozen_string_literal: true
require_relative 'regular_item'

class ConjuredItem < RegularItem
  def update_quality
    self.quality -= 2
  end
end
