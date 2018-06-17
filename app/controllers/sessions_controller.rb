class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash.now[:success] = "Добро пожаловать, " + current_user.name
    else
      flash.now[:danger] = "Не верные логин/пароль"
      render 'new'
    end
  end

end
