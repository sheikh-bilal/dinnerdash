# frozen_string_literal: true

# create cart table
class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end
