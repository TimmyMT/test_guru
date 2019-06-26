class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true, uniqueness: true
  validate :max_answers, on: :create

  scope :right_answers, -> { where(correct: true) }

  private

  def max_answers
    errors.add(:base, 'wrong count answers') if question.answers.count >= 4
  end

end
