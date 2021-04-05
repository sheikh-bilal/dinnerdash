# frozen_string_literal: true

# item policy
class ItemPolicy < ApplicationPolicy
  def new?
    authenticate?
  end

  def create?
    authenticate?
  end

  def index?
    false
  end

  def edit?
    authenticate?
  end

  def show?
    authenticate?
  end

  def destroy?
    authenticate?
  end

  private
  def authenticate?
    return true if user.present? && user.admin?
  end
end
