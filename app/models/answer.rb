class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy
end
