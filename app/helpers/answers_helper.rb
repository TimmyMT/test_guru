module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create a new answer for #{answer.question.test.title} question"
    else
      "Edit answer for #{answer.question.test.title} question"
    end
  end
end
