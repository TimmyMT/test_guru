class User < ApplicationRecord
  MAILFORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: MAILFORMAT }

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_tests_level(level)
    tests.where(level: level)
  end

end
