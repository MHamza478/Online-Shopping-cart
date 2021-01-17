# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.create(total: total)
    cart.each do |item|
      OrderItem.create!(
        order_id: @order.id,
        product_id: item['product_id'],
        unit_price: item['unit_price'],
        quantity: item['quantity']
      )
    end
    empty_cart
    redirect_to root_url
  end

  private

  def total
    cart.inject(0) { |sum, x| sum + (x[:unit_price].to_i * x[:quantity].to_i) }
  end
end
