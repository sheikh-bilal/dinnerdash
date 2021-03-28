# frozen_string_literal: true

# add categoryid to items
class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id, :integer
  end
end
