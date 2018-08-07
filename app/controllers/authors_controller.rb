class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def update
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      flash.now[:warning] = @author.errors.full_messages
      render 'new'
    end
  end

  def index
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:name, :date_of_birth, :date_of_death, :country_id, :description)
  end
end
