# frozen_string_literal: true

class Order
  attr_reader :basket

  def initialize(menu:)
    @basket = {}
    @menu = menu
  end

  def add(item, quantity)
    return basket[item] += quantity if basket.key?(item)
    basket.merge!(item.to_s => quantity)
  end

  def checkout
    basket.keys.inject(0) do |total, item|
      total += menu.prices[item] * basket[item]
    end
  end

  private

  attr_reader :menu
end
