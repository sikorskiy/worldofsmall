class BooksController < ApplicationController
  before_action :find_book, only: [:add_wishbook, :show]

  def new
    @book = Book.new
  end

  def about

  end

  def edit
    if logged_in?
      @book = Book.find(params[:id])
    else
      flash[:warning] = "Только зарегистрированные пользователи могут редактировать книги"
      redirect_to books_path
    end
  end

  def update
    if !logged_in?
      flash[:warning] = "Только зарегистрированные пользователи могут редактировать книги"
      redirect_to 'edit'
    end
    @book = Book.find(params[:id])
    @book.user = current_user
    @book.update_attributes(book_params)
    if @book.errors.any?
      flash.now[:warning] = @book.errors.full_messages
      render "edit"
    #elsif params[:book][:image].present?
    #  render 'crop'
    else
      
      redirect_to book_path(@book)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    if @book.errors.any?
      flash.now[:warning] = @book.errors.full_messages
      render 'new'
  #  elsif params[:book][:image].present?
  #    render 'crop'
    else
      redirect_to book_path(@book)
    end
  end

  def show
    @rating_types = get_rating_types
  end

  def index
    @books = Book.all.order(:id)
  end

  def home
    @books = Book.search_book(params[:age], params[:rating]).page params[:page]
  end

  def google_verification
    redirect_to "google963acee8adc56ebe.html"
  end

  private
  def book_params
    params.require(:book).permit(:author, :name, :creation_year, :publishing_house, :illustrator, :info, :translator, :image, :start_age, :finish_age)
  end

  def search_params
    params.permit(:age, :rating)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
