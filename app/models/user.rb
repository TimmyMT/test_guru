class User < ApplicationRecord
  has_many :creator, :class_name => 'Test', :foreign_key => 'creator_id'
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_tests_level(level)
    tests.where(level: level)
  end

end
