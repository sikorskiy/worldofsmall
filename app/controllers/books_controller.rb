class BooksController < ApplicationController
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
    @book.update_attributes(book_params)
    if @book.errors.any?
      render "edit"
    else
      redirect_to book_path(@book)
    end
  end

  def create
    @book = Book.create(book_params)
    if @book.errors.any?
      render "new"
    else
      redirect_to book_path(@book)
    end
  end

  def show
    @book = Book.find(params[:id])
    reviews = @book.reviews
    if reviews.empty?
      @average_general_rating, @average_content_rating, @average_illustrator_rating = 0
    else
      @average_general_rating = reviews.average(:general_rating).round(2)
      @average_illustrator_rating = reviews.average(:illustrator_rating).round(2)
      @average_content_rating = reviews.average(:content_rating).round(2)
    end
  end

  def index
    @books = Book.all
  end

  def home
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:author, :name, :creation_year, :publishing_house, :illustrator, :info, :translator, :image)
  end
end
