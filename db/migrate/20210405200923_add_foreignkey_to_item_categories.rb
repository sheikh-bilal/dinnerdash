class AddForeignkeyToItemCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_categories, :item_id
    remove_column :item_categories, :category_id
    add_reference  :item_categories, :item, index: true, foreign_key: true
    add_reference  :item_categories, :category, index: true, foreign_key: true
  end
end
