class BadgeControlService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    badges = []
    Badge.all.each do |badge|
      badges << badge if send("control_#{badge.control}", badge.control_param)
    end
    return badges
  end

  private

  def control_1(category)
    tests_category_count = Test.where(category_id: Category.find_by(title: category.to_s).id).count

    user_completed_tests_category = 0
    @user.test_passages.where(passed: true).pluck('DISTINCT test_id').each do |id|
      user_completed_tests_category += 1 if Test.find(id).category_id == Category.find_by(title: category.to_s).id
    end

    return tests_category_count == user_completed_tests_category
  end

  def control_2(nothing)
    count_tests = @user.test_passages.where(test_id: @test_passage.test.id).count
    return count_tests == 1 && @test_passage.passed == true && nothing == ''
  end

  def control_3(level)
    count_tests = Test.where(level: level.to_i).count

    user_count_tests = 0
    @user.test_passages.where(passed: true).pluck('DISTINCT test_id').each do |id|
      user_count_tests += 1 if Test.find(id).level == level.to_i
    end

    return count_tests == user_count_tests && count_tests != 0
  end

end
