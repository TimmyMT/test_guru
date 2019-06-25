class Test < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  belongs_to :category

  has_many :questions, dependent: :nullify
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.sort_category(name)
    joins(:category)
      .where(categories: {title: name})
      .order(title: :desc).pluck(:title)
  end

end
