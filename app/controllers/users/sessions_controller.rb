class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:success] = t('devise.welcome_user', user: current_user.first_name)
  end

  private

  def after_sign_in_path_for(user)
    user.admin? ? admin_root_path : super
  end

end
