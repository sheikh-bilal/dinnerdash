class ItemPolicy < ApplicationPolicy

  def create?
    return true if user.present? and user.admin?
  end

  def index?
    false
  end

  def edit?
    if user.present?
      user.admin?
    else
      return false
    end
  end

  def show?
    return true if user.present? and user.admin?
  end

  def destroy?
    return true if user.present? and user.admin?
  end

end
