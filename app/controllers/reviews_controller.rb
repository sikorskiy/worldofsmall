class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review, only: [:destroy, :edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book = @book

    if @review.save
      redirect_to book_path(@review.book)
    else
      render 'new'
    end

  end

  def edit
  end

  def destroy
    @review.destroy
    redirect_to book_path(@book)
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to book_path(@review.book)
    else
      render 'edit'
    end

  end

  private
  def review_params
    params.require(:review).permit(:content)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
