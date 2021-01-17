# frozen_string_literal: true

module ApplicationHelper
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def cart
    session[:cart] ||= []
  end

  def empty_cart
    session[:cart] = []
  end
end
