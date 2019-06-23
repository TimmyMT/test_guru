class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users
  has_one :test_creator, dependent: :destroy

  def self.sort_on_category(name)
    where(category_id: Category.find_by(title: name).id)
        .order(title: :desc).pluck(:title)
  end

end
