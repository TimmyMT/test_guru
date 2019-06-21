class User < ApplicationRecord

  def show_tests_with_level(level)
    Result.joins('join tests, users on tests.id = results.test_id and users.id = results.user_id')
        .where(users: {name: self.name}, tests: {level: level})
        .pluck('tests.title', 'results.status')
  end

end
