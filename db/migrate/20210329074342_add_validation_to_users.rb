# frozen_string_literal: true

# add validation
class AddValidationToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :fname, false
    change_column_null :users, :email, false
  end
end
