class User < ApplicationRecord

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_tests_level(level)
    tests.where(level: level)
  end

end
