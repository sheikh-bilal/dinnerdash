# frozen_string_literal: true

# class order
class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
end
