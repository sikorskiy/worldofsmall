class Book < ApplicationRecord
  validates :name, :author, :info, presence: true
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy
end
