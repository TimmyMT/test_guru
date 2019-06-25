class Test < ApplicationRecord
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  has_many :questions, dependent: :nullify
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :category, lambda { |name|
    joins('join categories on tests.category_id = categories.id')
    .where(categories: { title: name })
    .order(title: :desc)
  }

  def self.sort_category(name)
    category(name).pluck(:title)
  end

end
