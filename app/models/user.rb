class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :test_creators, dependent: :destroy

  def show_tests_level(level)
    tests.where(level: level)
  end

end
