class RatingType < ApplicationRecord
  validates :rating_type, :description, presence: true
  validates :rating_type, uniqueness: true
  has_many :ratings
end
