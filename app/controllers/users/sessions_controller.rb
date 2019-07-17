class Users::SessionsController < Devise::SessionsController

  before_action :after_sign_in_path, only: :create

  def create
    super
    flash[:notice] = "Hello #{current_user.first_name}!"
  end

  private

  def after_sign_in_path
    redirect_to admin_root_path if current_user.admin?
  end

end
