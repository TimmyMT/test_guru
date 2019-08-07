class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.valid?
      flash[:success] = t('feedbacks.created')
      FeedbacksMailer.send_mail(@feedback).deliver_now
      redirect_to root_path
    else
      flash[:alert] = 'Aborted'
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
