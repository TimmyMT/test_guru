class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

end
