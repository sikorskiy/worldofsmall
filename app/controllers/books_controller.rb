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
