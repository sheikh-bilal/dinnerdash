# frozen_string_literal: true

# create cart items
class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.integer :item_id
      t.integer :cart_id
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
  end
end
