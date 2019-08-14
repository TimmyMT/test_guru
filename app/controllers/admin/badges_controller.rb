class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:edit, :update, :destroy]
  before_action :admin_permissions

  def new
    @badge = Badge.new
  end

  def edit

  end

  def update
    if @badge.update(badge_params)
      flash[:success] = 'Badge updated!'
      redirect_to badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:success] = 'Badge created!'
      redirect_to badges_path
    else
      flash[:error] = 'Not created!'
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path
  end

  private

  def admin_permissions
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :picture, :control, :control_param)
  end

end
