# frozen_string_literal: true

class RemoveColumnTotalPriceFromOrderItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :total_price
  end
end
