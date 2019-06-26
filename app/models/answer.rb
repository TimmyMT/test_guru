class Answer < ApplicationRecord
  validates :body, presence: true, uniqueness: true
  validate :max_answers, on: :create

  belongs_to :question

  scope :right_answers, -> { self.where(correct: true) }

  private

    def max_answers
      errors.add(:base, 'wrong count answers') if question.answers.count >= 4
    end

end
