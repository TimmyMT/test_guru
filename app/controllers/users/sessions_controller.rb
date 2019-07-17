class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Hello #{current_user.first_name}!"
  end

  private

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : super
  end

end
