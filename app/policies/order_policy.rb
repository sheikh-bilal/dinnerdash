class OrderPolicy < ApplicationPolicy

  def create?
    return true if user.present?
  end
end
