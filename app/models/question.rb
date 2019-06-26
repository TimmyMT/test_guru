class Question < ApplicationRecord
  validates :body, presence: true, uniqueness: true

  belongs_to :test

  has_many :answers, dependent: :nullify
end
