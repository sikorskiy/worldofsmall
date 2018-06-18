class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash.now[:danger] = @user.errors.full_messages
      render 'new'
    else
      log_in(@user)
      redirect_to user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation)
  end
end
