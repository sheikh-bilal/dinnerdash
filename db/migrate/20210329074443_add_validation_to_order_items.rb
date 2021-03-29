# frozen_string_literal: true

# add validation
class AddValidationToOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_items, :quantity, false
    change_column_null :order_items, :total, false
    change_column_null :order_items, :unit_price, false
    change_column_null :order_items, :item_id, false
    change_column_null :order_items, :order_id, false
  end
end
