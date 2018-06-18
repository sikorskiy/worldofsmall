module BooksHelper
  def user_review(user)
    user.reviews.new
  end
end
