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
      get_rating_types.each do |r|  
        Rating.create(review_id: @review.id, rating: params[:review]["rating_type_#{r.id}".to_sym].to_f, rating_type_id: r.id)
        #byebug
      end
      redirect_to book_path(@review.book)
    else
      flash.now[:warning] = @review.errors.full_messages
      render 'new'
    end

  end

  def edit
  end

  def destroy
    get_rating_types.each do |r|  
      @rating = Rating.find_by(review_id: @review.id, rating_type_id: r.id)
      @rating.destroy unless @rating.nil?
    end

    @review.destroy
    redirect_to book_path(@book)
  end

  def update
    if @review.update_attributes(review_params)
      get_rating_types.each do |r|  
        @rating = Rating.find_by(review_id: params[:id], rating_type_id: r.id)
        @rating.update_attribute(:rating, params[:review]["rating_type_#{r.id}".to_sym].to_f)
      end
      redirect_to book_path(@review.book)
    else
      flash.now[:warning] = @review.errors.full_messages
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
