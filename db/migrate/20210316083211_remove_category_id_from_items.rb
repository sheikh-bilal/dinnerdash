# frozen_string_literal: true

# remove cat id column
class RemoveCategoryIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :category_id
  end
end
