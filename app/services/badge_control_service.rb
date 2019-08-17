class BadgeControlService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.select{|badge| send("control_#{badge.control}", badge)}
  end

  def user_tests
    @user.test_passages.where(passed: true)
  end

  def badge_present?(badge)
    @user.badges.include?(badge)
  end

  private

  def control_1(badge)
    all_tests_for_category = Test.joins(:category)
                                 .where(categories: {title: badge.control_param.to_s})
                                 .pluck(:id)

    user_tests_for_category = user_tests.joins(:test => :category)
                                  .where(categories: {title: badge.control_param.to_s})
                                  .pluck(:test_id)

    all_tests_for_category == user_tests_for_category && badge_present?(badge) == false
  end

  def control_2(badge)
    test_first_try = user_tests.where(test_id: @test_passage.test.id).count
    test_first_try == 1 && badge.control_param == ''
  end

  def control_3(badge)
    all_tests_for_level = Test.where(level: badge.control_param.to_i)
                              .order(id: :desc)
                              .pluck(:id)

    user_tests_for_level = user_tests.joins(:test)
                               .where(tests: {level: badge.control_param.to_i})
                               .order(test_id: :desc)
                               .pluck(:test_id)

    all_tests_for_level == user_tests_for_level && badge_present?(badge) == false
  end

end
