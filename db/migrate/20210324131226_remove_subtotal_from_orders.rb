class RemoveSubtotalFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :subtotal
    add_column :orders, :status, :string, default: 'pending'
  end
end
