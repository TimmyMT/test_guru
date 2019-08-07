class FeedbacksMailer < ApplicationMailer
  # before_action :receiver

  def send_mail(feedback)
    @feedback = feedback
    mail(to: 'mathcoredetected@gmail.com', from: @feedback.user.email, subject: @feedback.title)
  end

  private

  # def receiver
  #   @admin = User.find_by(type: 'Admin')
  # end

end
