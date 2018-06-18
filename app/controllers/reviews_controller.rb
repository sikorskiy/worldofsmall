class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.create(book_id: params[:book_id], content: params[:review][:content], user_id: current_user.id)
    redirect_to book_path(@review.book)
  end
end
