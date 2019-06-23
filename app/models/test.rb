class Test < ApplicationRecord
  has_many :questions
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author

  def self.sort_on_category(name)
    joins('join categories
    on tests.category_id = categories.id')
        .where(categories: { title: name })
        .order(title: :desc)
        .pluck(:title)
  end

end
