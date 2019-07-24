class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :nullify
  has_many :gists

  validates :body, presence: true, uniqueness: true
end
