class AddForeignkeyToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :user_id
    add_reference :orders, :user, index: true, foreign_key: true
  end
end
