class User < ApplicationRecord
  MAILFORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: MAILFORMAT }

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  def show_tests_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
