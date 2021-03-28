# frozen_string_literal: true

# class orderitem
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
end
