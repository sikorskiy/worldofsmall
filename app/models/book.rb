class Book < ApplicationRecord
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  validates :name, :author, :info, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :wishbooks, dependent: :destroy
  has_many :ratings, through: :reviews

  #after_update :crop_book_image

  def crop_book_image
    image.recreate_versions! if crop_x.present?
  end

  def self.search_book(age = 0) #should be better, to get hash and use all keys
    if age.nil? || age == ''
      all
    else
      where('start_age >= ?', age)
    end

  end
  
  def average_special_rating(id)
    ratings.where(rating_type_id: id).average(:rating)
  end

  def average_rating
    ratings.average(:rating)
  end

  def get_ratings
    ratings.joins(:rating_type).select(:rating_type_id, :rating_type, :rating).group(:rating_type, :rating_type_id).average(:rating)
  end
end
