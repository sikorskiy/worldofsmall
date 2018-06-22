module ReviewsHelper
  def average_rating(review)
    (review.general_rating + review.illustrator_rating + review.content_rating)/3.0.round(2)
  end
end
