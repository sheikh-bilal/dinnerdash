# frozen_string_literal: true

# class bill
class BillsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
  end
end
