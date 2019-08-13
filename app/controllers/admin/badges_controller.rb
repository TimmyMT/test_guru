class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])
    if @badge.update(badge_params)
      flash[:success] = 'Badge updated!'
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:success] = 'Badge created!'
      redirect_to admin_badges_path
    else
      flash[:error] = 'Not created!'
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :picture, :control, :control_param)
  end

end
