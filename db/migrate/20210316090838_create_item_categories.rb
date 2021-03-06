# frozen_string_literal: true

# create table for cat and items keys
class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.integer :item_id
      t.integer :category_id
    end
  end
end
