# require_relative '../../app/models/feedback'
class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.send_mail(@feedback).deliver_now
      flash[:success] = t('feedbacks.created')
    else
      flash[:alert] = 'Aborted'
    end
    redirect_to new_feedback_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :email)
  end

end
