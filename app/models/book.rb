class Book < ApplicationRecord
  validates :name, :author, :info, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy

  def self.search_book(age = 0) #should be better, to get hash and use all keys
    if age.nil? || age == ''
      all
    else
      where('start_age >= ?', age)
    end

  end

  def average_rating
    reviews.average(:general_rating).round(2)
  end
end
