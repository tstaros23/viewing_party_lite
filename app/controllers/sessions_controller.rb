class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/login'
      flash[:alert] = "Bad Credentials: Try again."
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end
