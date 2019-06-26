class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :tests, dependent: :nullify

  scope :sort_names, -> { self.all.order(title: :asc) }
end
