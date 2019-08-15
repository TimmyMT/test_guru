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
    category_tests = Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
                                .where(categories: {title: category})
                                .order(id: :desc).pluck(:id)

    user_completed_tests = @user.test_passages.joins('INNER JOIN tests ON tests.id = test_passages.test_id
                                                      INNER JOIN categories ON categories.id = tests.category_id')
                                                    .where(test_passages: {passed: true}, categories: {title: category})
                                                    .order(id: :desc).pluck(:test_id)

    category_tests == user_completed_tests
  end

  def control_2(nothing)
    count_tests = @user.test_passages.where(test_id: @test_passage.test.id).where(passed: true).count
    count_tests == 1 && nothing == ''
  end

  def control_3(level)
    level_tests = Test.where(level: level.to_i).order(id: :desc).pluck(:id)

    user_tests = @user.test_passages.joins('join tests on tests.id = test_passages.test_id')
      .where(tests: {level: level.to_i}, test_passages: {passed: true})
      .order(test_id: :desc).pluck(:test_id)

    level_tests == user_tests
  end

end
