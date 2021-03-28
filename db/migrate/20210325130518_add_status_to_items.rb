# frozen_string_literal: true

# add column status
class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :string, default: 'active'
  end
end
