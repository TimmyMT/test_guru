class BadgeControlService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  # private

  def add_badge(badge)
    @user.badges.push(badge)
  end

  def all_tests_category(category)
    tests_category_count = Test.where(category_id: Category.find_by(title: category.to_s).id).count
    user_colmpleted_tests_category = @user.test_passages
      .where(passed: true)
      .where(test_id: Test.find_by(category_id: Category.find_by(title: category.to_s)))
      .pluck('DISTINCT test_id').count

    #puts "Tests with Category count = #{tests_category_count}"
    #puts "User tests with Category count = #{user_colmpleted_tests_category}"
    return tests_category_count == user_colmpleted_tests_category
  end

  def first_try_completed?
    count_tests = @user.test_passages.where(test_id: @test_passage.test.id).count
    return count_tests == 1 && @test_passage.passed == true
  end

  def all_tests_level(level)
    count_tests = Test.all.where(level: level.to_i).count
    user_count_tests = @user.test_passages
      .where(passed: true)
      .where(test_id: Test.find_by(level: level.to_i))
      .pluck('DISTINCT test_id')
      .count
    # puts "count tests with level #{count_tests}"
    # puts "count user tests with level #{user_count_tests}"
    return count_tests == user_count_tests && count_tests != 0
  end

end
