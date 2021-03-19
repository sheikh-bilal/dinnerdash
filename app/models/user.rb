class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #Devise::email_regexp is currently defined as: /\A[^@\s]+@[^@\s]+\z/ which doesn't validate all emails so i am using my own

  validates :fname, presence: true, length: {minumum: 3, maximum: 25}
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :dname, length: {minumum: 3, maximum: 32}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
