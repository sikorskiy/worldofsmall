class Review < ApplicationRecord
  validates :user_id, :book_id, :content, presence: true
  validates :content, length: {minimum: 3, maximum: 3000}
  default_scope -> {order(created_at: :desc)}

  belongs_to :book
  belongs_to :user
end
