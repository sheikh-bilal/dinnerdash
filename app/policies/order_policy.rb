class OrderPolicy < ApplicationPolicy

  def create?
    return true if user.present?
  end

  def show?
    return true if (user.present? and (record.user_id == user.id))
  end

  def showUI?
    return true if user.present? and user.admin?
  end

  def edit?
    return true if user.present? and user.admin?
  end

  def update?
    return true if user.present? and user.admin?
  end
end
