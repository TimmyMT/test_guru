module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create a new #{question.test.title} question"
    else
      "Edit #{question.test.title} question"
    end
  end
end
