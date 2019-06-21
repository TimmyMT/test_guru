class User < ApplicationRecord

  def show_tests_with_level(level)
    Test.all.joins('join results, users on tests.id = results.test_id and users.id = results.user_id')
        .where(users: {id: self.id}, tests: {level: level})
        # .pluck('tests.title', 'results.status')
  end

end
