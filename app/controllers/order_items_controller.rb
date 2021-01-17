# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    cart << order_item_params
    redirect_to root_url
  end

  def destroy
    session[:cart] = cart.reject { |item| item['product_id'] == params[:id] }
    redirect_to carts_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :unit_price, :name, :image_url)
  end
end
