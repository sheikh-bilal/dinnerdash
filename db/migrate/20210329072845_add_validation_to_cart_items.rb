class AddValidationToCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :quantity, false
    change_column_null :cart_items, :total, false
    change_column_null :cart_items, :unit_price, false
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :cart_id, false
  end
end
