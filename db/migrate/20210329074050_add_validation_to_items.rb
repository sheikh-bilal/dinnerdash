# frozen_string_literal: true

# add validation
class AddValidationToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :title, false
    change_column_null :items, :price, false
    change_column_null :items, :desc, false
  end
end
