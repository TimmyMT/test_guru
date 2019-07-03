module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create a new answer for question"
    else
      "Edit answer"
    end
  end
end
