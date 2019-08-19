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

  private

  def control_1(badge)
    return if badge.control_param.to_s != @test_passage.test.category.title

    tests_category = Test.joins(:category)
                                 .where(categories: {title: badge.control_param.to_s})
                                 .pluck(:id)

    user_tests_category = user_tests.joins(test: :category)
                                  .where(categories: {title: badge.control_param.to_s})
                                  .pluck(:test_id)

    user_similar_badges_count = @user.badges.where(id: badge.id).count

    expected_count = user_similar_badges_count + 1

    map_test_id_to_count = {}

    user_tests_category.each do |test_id|
      map_test_id_to_count[test_id] = map_test_id_to_count.fetch(test_id, 0) + 1
    end

    # every_test_passed_least_expected_count
    tests_category.all? { |test_id| map_test_id_to_count.fetch(test_id, 0) >= expected_count }
  end

  def control_2(badge)
    return if badge.control_param.to_s != ''

    # tests_passed_count = user_tests.where(test_id: @test_passage.test.id).count
    # tests_passed_count == 1 && badge.control_param == ''
    @test_passage.succesful? && badge.control_param == ''
  end

  def control_3(badge)
    return if badge.control_param.to_i != @test_passage.test.level
    tests_with_level = Test.where(level: badge.control_param.to_i)
                              .order(id: :desc)
                              .pluck(:id)

    user_tests_with_level = user_tests.joins(:test)
                               .where(tests: {level: badge.control_param.to_i})
                               .order(test_id: :desc)
                               .pluck(:test_id)

    user_similar_badges_count = @user.badges.where(id: badge.id).count

    expected_count = user_similar_badges_count + 1

    map_test_id_to_count = {}

    user_tests_with_level.each do |test_id|
      map_test_id_to_count[test_id] = map_test_id_to_count.fetch(test_id, 0) + 1
    end

    # every_test_passed_least_expected_count
    tests_with_level.all? { |test_id| map_test_id_to_count.fetch(test_id, 0) >= expected_count }
  end

end
