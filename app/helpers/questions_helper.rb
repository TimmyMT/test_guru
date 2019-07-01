module QuestionsHelper
  def question_header(question)
    "#{question.test.title}"
  end
end
