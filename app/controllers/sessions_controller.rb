class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Добро пожаловать, " + current_user.name
      redirect_to root_path
    else
      flash.now[:danger] = "Не верные логин/пароль"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
