# frozen_string_literal: true

# class user
class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  # Devise::email_regexp is currently defined as: /\A[^@\s]+@[^@\s]+\z/ which doesn't validate all emails

  validates :fname, presence: true, length: { in: 3..25 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :dname, length: { in: 2..25 }, allow_blank: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

end
