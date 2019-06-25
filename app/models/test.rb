class Test < ApplicationRecord
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  has_many :questions, dependent: :nullify
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.sort_on_category(name)
    joins('join categories
    on tests.category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desc)
      .pluck(:title)
  end

end
