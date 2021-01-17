# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authorize, only: [:show]

  def show
    @cart_items = cart.to_a
    @order_items = current_order.order_items.new
  end

  def destroy
    empty_cart
    redirect_to root_path
  end
end
