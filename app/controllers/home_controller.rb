# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authorize, only: [:index]

  def index
    @products = Product.all
    @order_items = current_order.order_items.new
  end
end
