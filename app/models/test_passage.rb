class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :sef_current_question
  before_update :before_update_test_passed
  before_commit :before_commit_check_time_over

  def expected_time
    created_at + test.timeleft.minutes
  end

  def timer_ticks
    ((expected_time) - Time.current).to_i
  end

  def time_over?
    (expected_time) < Time.current
  end

  def before_update_test_passed
    self.passed = succesful? if completed?
  end

  def before_commit_check_time_over
    if time_over? && !destroyed?
      self.current_question = nil
      self.time_over = true
    end
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids) && !time_over?
    save!
  end

  def current_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def result_percent
    ((correct_questions * 100) / test.questions.count.to_f).to_i
  end

  def succesful?
    true if result_percent >= 85
  end

  def completed?
    current_question.nil?
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def sef_current_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = questions_collection.first
    end
  end

  def questions_collection
    test.questions.order(:id).where('id > ?', current_question.id)
  end

end
