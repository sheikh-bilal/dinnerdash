# frozen_string_literal: true

# class cart
class Cart < ApplicationRecord
  include CartsHelper
  has_many :cart_items, dependent: :destroy
  before_save :set_subtotal

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
