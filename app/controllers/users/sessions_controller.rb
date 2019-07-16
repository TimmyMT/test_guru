class Users::SessionsController < Devise::SessionsController

  before_action :redirect_admin, only: :create
  after_action :hello_user, only: :create

  def hello_user
    flash[:notice] = "Hello #{current_user.first_name}!"
  end

  def create
    super
  end

  private

  def redirect_admin
    redirect_to admin_tests_path if admin?
  end

end
