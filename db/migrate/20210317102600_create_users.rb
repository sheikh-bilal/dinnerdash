# frozen_string_literal: true

# create user table
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :email
      t.string :dname
      t.timestamps
      t.boolean :admin, default: false
    end
  end
end
