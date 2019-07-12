class SessionsController < ApplicationController
  before_action :save_back_url, only: :new

  def save_back_url
    cookies[:prev_url] = request.headers["HTTP_REFERER"]
  end

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:prev_url].present?
        redirect_to cookies[:prev_url]
      else
        redirect_to tests_path
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    # cookies[:email] = nil
    redirect_to login_path
  end

end
