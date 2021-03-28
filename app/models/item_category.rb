# frozen_string_literal: true

# class itemcategory
class ItemCategory < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
