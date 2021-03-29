# frozen_string_literal: true

# add validation
class AddValidationToCategories < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :name, false
  end
end
