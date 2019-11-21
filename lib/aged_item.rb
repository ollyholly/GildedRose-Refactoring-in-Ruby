# frozen_string_literal: true

require_relative 'regular_item'

class AgedItem < RegularItem
  def update_quality
    self.quality += 1
    accelerate
    drop_quality
  end

  def accelerate; end

  def drop_quality; end
end
