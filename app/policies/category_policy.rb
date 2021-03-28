# frozen_string_literal: true

# policy for category
class CategoryPolicy < ApplicationPolicy
  def index?
    return true if user.present? && user.admin?
  end

  def show?
    return true if user.present? && user.admin?
  end

  def edit?
    return true if user.present? && user.admin?
  end

  def create?
    return true if user.present? && user.admin?
  end

  def destroy?
    return true if user.present? && user.admin?
  end
end
