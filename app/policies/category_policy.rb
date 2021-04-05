# frozen_string_literal: true

# policy for category
class CategoryPolicy < ApplicationPolicy

  def new?
    check_admin?
  end

  def index?
    check_admin?
  end

  def show?
    check_admin?
  end

  def edit?
    check_admin?
  end

  def create?
    check_admin?
  end

  def destroy?
    check_admin?
  end

  private
  def check_admin?
    return true if user.present? && user.admin?
  end
end
