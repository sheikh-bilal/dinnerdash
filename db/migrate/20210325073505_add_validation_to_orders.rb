# frozen_string_literal: true

# add db validation
class AddValidationToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :user_id, false
    change_column_null :orders, :total, false
  end
end
