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
    puts "Tests with Category count = #{tests_category_count}"
    puts "User tests with Category count = #{user_colmpleted_tests_category}"
  end

end
