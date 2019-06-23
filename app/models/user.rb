class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authors

  def show_tests_with_level(level)
    Test.joins('join tests_users
        on tests.id = tests_users.test_id')
        .where(tests_users: {user_id: id}, tests: {level: level})
  end

end
