module CartItemsHelper
  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total
    unit_price*quantity
  end
end
