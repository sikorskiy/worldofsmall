class Author < ApplicationRecord
  validates_presence_of :name
  belongs_to :country
  has_many :authorships, dependent: :delete_all
  has_many :books, through: :authorships, dependent: :destroy
end
