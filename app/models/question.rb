class Question < ApplicationRecord
  belongs_to :test
  has_one :answer
end
