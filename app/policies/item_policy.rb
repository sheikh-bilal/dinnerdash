# frozen_string_literal: true

# item policy
class ItemPolicy < ApplicationPolicy
  def new?
    return true if user.present? && user.admin?
  end

  def create?
    return true if user.present? && user.admin?
  end

  def index?
    false
  end

  def edit?
    return true if user.present? && user.admin?
  end

  def show?
    return true if user.present? && user.admin?
  end

  def destroy?
    return true if user.present? && user.admin?
  end
end
