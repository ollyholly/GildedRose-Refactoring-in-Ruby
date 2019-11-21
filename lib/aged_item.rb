# frozen_string_literal: true

require_relative 'regular_item'

class AgedItem < RegularItem
  def update_quality
    if self.quality < 50
      self.quality += 1
      accelerate
    end
    drop_quality
  end

  def accelerate; end

  def drop_quality
    self.quality = 50 if self.quality > 50
  end
end
