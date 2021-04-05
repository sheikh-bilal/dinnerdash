# frozen_string_literal: true

# class order policy
class OrderPolicy < ApplicationPolicy
  def create?
    return true if user.present?
  end

  def show?
    return true if (user.present? && user.admin?) || (user.present? && record.user_id == user.id)
  end

  def show_ui?
    authenticate?
  end

  def edit?
    authenticate?
  end

  def update?
    authenticate?
  end

  private
  def authenticate?
    return true if user.present? && user.admin?
  end
end
