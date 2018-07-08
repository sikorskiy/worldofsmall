class Review < ApplicationRecord
  validates :user_id, :book_id, presence: true
  validates :content, presence: {message: ": Отзыв не может быть пустым"}
  validates :content, length: {minimum: 3, maximum: 3000, message: ": Текст отзыва не может быть короче 3 символов и длиннее 3000."}
  validates :book_id, uniqueness: { scope: :user_id,
                                 message: ": Один пользователь может оставить только 1 отзыв на книгу" }
  default_scope -> { order(created_at: :desc) }

  belongs_to :book
  belongs_to :user
  has_many :ratings
  has_many :rating_types, through: :ratings

  def average_review_rating
    ratings.where("rating > 0").average(:rating)
  end

end
