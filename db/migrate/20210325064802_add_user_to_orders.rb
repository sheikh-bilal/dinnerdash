# frozen_string_literal: true

# add user_id to orders
class AddUserToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer
  end
end
