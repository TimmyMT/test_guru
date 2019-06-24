class Test < ApplicationRecord
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.sort_on_category(name)
    where(category_id: Category.find_by(title: name).id)
        .order(title: :desc).pluck(:title)
  end

end
