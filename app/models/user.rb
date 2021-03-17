class User < ApplicationRecord
  validates :fname, presence: true, length: {minumum: 3, maximum: 25}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :dname, length: {minumum: 3, maximum: 32}
end
