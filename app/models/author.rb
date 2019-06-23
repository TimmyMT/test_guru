class Author < ApplicationRecord
  has_one :tests
  belongs_to :user
end
