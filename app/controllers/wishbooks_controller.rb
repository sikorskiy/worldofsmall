class WishbooksController < ApplicationController
  before_action :find_book
  def new
  end


  def create
    @wishbook = Wishbook.new
    @wishbook.book = @book
    @wishbook.user = current_user
    if @wishbook.save
      flash[:success] = "Книга '#{@book.name}' добавлена в список желаний"
      redirect_to book_path(@book)
    else
      flash[:warning] = "Возникла ошибка при добавлении книгу в Wishlist"
      redirect_to book_path(@book)
    end
  end

  def destroy
    @wishbook = Wishbook.find(params[:id])
    @wishbook.destroy
    flash[:success] = "Книга '#{@book.name}' удалена из списка желаний"
    redirect_to book_path(params[:book_id])
  end

  private
  def find_book
    @book = Book.find(params[:book_id])
  end
end
