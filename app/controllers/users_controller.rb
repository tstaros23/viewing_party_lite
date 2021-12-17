class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    elsif params[:password] != params[:password_confirmation]
      redirect_to '/register'
      flash[:alert] = 'Password and Password confirmation must match'
    else
      redirect_to '/register'
      flash[:alert] = 'Please enter valid data'
    end
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/login'
      flash[:alert] = "Bad Credentials: Try again."
    end
  end

    private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
