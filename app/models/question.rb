class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :nullify

  validates :body, presence: true, uniqueness: true
end
