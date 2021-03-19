class UserPolicy < ApplicationPolicy

  def index?
    return true if user.present? && user.admin?
  end

  def edit?
    return true if user.present? and user.admin?
  end

  def show?
    return true if user.present? and user.admin?
  end

end
