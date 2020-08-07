class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Email or Password is not correct!"
      render "new"
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
end
