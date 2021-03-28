# frozen_string_literal: true

# create orders table
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end
