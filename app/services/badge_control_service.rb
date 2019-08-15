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
    all_tests_for_category = Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
                                .where(categories: {title: category})
                                .order(id: :desc).pluck(:id)

    user_tests_for_category = @user.test_passages.joins('INNER JOIN tests ON tests.id = test_passages.test_id
                                                      INNER JOIN categories ON categories.id = tests.category_id')
                                                    .where(test_passages: {passed: true}, categories: {title: category})
                                                    .order(id: :desc).pluck(:test_id)

    all_tests_for_category == user_tests_for_category
  end

  def control_2(nothing)
    test_first_try = @user.test_passages.where(test_id: @test_passage.test.id).where(passed: true).count
    test_first_try == 1 && nothing == ''
  end

  def control_3(level)
    all_tests_for_level = Test.where(level: level.to_i).order(id: :desc).pluck(:id)

    user_tests_for_level = @user.test_passages.joins('join tests on tests.id = test_passages.test_id')
      .where(tests: {level: level.to_i}, test_passages: {passed: true})
      .order(test_id: :desc).pluck(:test_id)

    all_tests_for_level == user_tests_for_level
  end

end
