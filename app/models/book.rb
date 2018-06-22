class Book < ApplicationRecord
  validates :name, :author, :info, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy
end
