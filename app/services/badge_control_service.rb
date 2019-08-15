class BadgeControlService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    badges = []
    badges << Badge.all.select{ |badge| send("control_#{badge.control}", badge.control_param) unless @user.badges.include?(badge) && badge.control_param != '' }
  end

  private

  def control_1(category)
    category_tests = Category.find_by(title: category).tests.pluck('DISTINCT id')
    user_completed_tests = @user.test_passages.where(passed: true).pluck('DISTINCT test_id')
    category_tests == user_completed_tests
  end

  def control_2(nothing)
    count_tests = @user.test_passages.where(test_id: @test_passage.test.id).where(passed: true).count
    count_tests == 1 && nothing == ''
  end

  def control_3(level)
    level_tests = Test.where(level: level.to_i).pluck('DISTINCT id').count
    user_tests = @user.test_passages
                     .where(passed: true)
                     .where(test_id: Test.where(level: level.to_i))
                     .pluck('DISTINCT test_id').count
    level_tests == user_tests && level_tests != 0
  end

end
