class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :fname, presence: true, length: {minumum: 3, maximum: 25}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :dname, length: {minumum: 3, maximum: 32}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
