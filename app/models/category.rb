class Category < ApplicationRecord
  has_many :authorships
  has_many :books, through: :categorizations

  validates :name, presence: true
end
