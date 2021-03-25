module OrdersHelper
  def dropdowndata(order)
    if order.status == 'pending'
      option = ['Cancel', 'pending', 'Completed', 'Paid']
    elsif order.status == 'Paid'
      option = ['Cancel', 'Completed', 'Paid']
    elsif order.status == 'Cancel'
      option = ['Cancel']
    else
      option = ['Completed']
    end
  end
end
