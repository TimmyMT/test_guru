class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :user

  validates :url, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true

end
