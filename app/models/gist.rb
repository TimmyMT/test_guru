class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :user

  validates :url, presence: true
  validates :gist_hash, presence: true

end
