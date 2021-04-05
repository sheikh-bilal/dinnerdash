class AddForeignkeyToCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :item_id
    remove_column :cart_items, :cart_id
    add_reference  :cart_items, :item, index: true, foreign_key: true
    add_reference  :cart_items, :cart, index: true, foreign_key: true
  end
end
