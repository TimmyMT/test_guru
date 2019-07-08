class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :sef_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_number
    test.questions.order(:id).pluck(:id).find_index(current_question.id) + 1
    # test.questions.order(:id).where('id > ?', current_question.id).index
  end

  def result_percent
    ((correct_questions * 100) / test.questions.count.to_f).to_i
  end

  def color_percent
    if self.result_percent >= 85
      'success'
    elsif self.result_percent < 85
      'fail'
    end
  end

  def completed?
    current_question.nil?
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def sef_current_question
    self.current_question = next_question
  end

  def next_question
    if completed?
      self.current_question = test.questions.first
    else
      self.current_question = questions_collection.first
    end
  end

  def questions_collection
    test.questions.order(:id).where('id > ?', current_question.id)
  end

end
