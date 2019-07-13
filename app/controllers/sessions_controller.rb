class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies.delete(:prev_url) || tests_path if cookies[:prev_url].present?
    else
      flash[:alert] = 'Something wrong, please try again'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
