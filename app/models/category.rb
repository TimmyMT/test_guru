class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :title, presence: true, uniqueness: true

  default_scope { order(title: :asc) }
end
