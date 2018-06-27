class User < ApplicationRecord
  validates :name, :email, :lastname, presence: true
  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true

  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy
  has_many :books
  has_one :role
end
