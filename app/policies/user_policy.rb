# frozen_string_literal: true

# policy for user
class UserPolicy < ApplicationPolicy
  def index?
    authenticate?
  end

  def edit?
    authenticate?
  end

  def show?
    authenticate?
  end

  def destroy?
    return true if user.present?
  end

  private
  def authenticate?
    return true if user.present? && user.admin?
  end
end
