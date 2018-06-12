class BooksController < ApplicationController
  def new
    @book = Book.new
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

  end

  private
  def book_params
    params.require(:book).permit(:author, :name, :creation_year, :publishing_house, :illustrator, :translator)
  end
end
