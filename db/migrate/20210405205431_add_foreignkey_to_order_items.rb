class AddForeignkeyToOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :item_id
    remove_column :order_items, :order_id
    add_reference  :order_items, :item, index: true, foreign_key: true
    add_reference  :order_items, :order, index: true, foreign_key: true
  end
end
