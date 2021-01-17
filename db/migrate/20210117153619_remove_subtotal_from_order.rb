# frozen_string_literal: true

class RemoveSubtotalFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :subtotal
  end
end
