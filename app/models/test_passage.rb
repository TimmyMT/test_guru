class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_change_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    # self.current_question = next_question
    save!
  end

  def current_number
    test.questions.order(:id).pluck(:id).find_index(current_question.id) + 1
  end

  def result_percent
    ((correct_questions * 100) / test.questions.count.to_f).to_i
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    # correct_answers_count = correct_answers.count
    # (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    #     correct_answers_count == answer_ids.count
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_change_question
    if completed?
      self.current_question = test.questions.order_by(:id).first
    else
      self.current_question = next_question
    end
  end

  def next_question
    questions_collection.first
  end

  def questions_collection
    test.questions.order(:id).where('id > ?', current_question.id)
  end

end
