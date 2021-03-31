# frozen_string_literal: true

# module order helper
module OrdersHelper
  def dropdowndata(order)
    case order.status
    when 'pending'
      %w[Cancel pending Completed Paid]
    when 'Paid'
      %w[Cancel Completed Paid]
    when 'Cancel'
      ['Cancel']
    else
      ['Completed']
    end
  end
end
