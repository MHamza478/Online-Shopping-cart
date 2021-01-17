# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_items

  def unit_price
    if persisted
      sef[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

end
