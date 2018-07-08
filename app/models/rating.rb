class Rating < ApplicationRecord
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_type_id, :review_id, presence: true
  belongs_to :rating_type
  has_one :review
  validates_associated :review
  has_one :book, through: :review
end
