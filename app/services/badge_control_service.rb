class BadgeControlService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.control
      when 1
        if badge.control_param.present?
          unless @user.badges.include?(badge)
            add_badge(badge) if all_tests_category(badge.control_param)
          end
        end
      when 2
        add_badge(badge) if first_try_completed?
      when 3
        if badge.control_param.present?
          unless @user.badges.include?(badge)
            add_badge(badge) if all_tests_level(badge.control_param)
          end
        end
      end
    end
  end

  private

  def add_badge(badge)
    @user.badges.push(badge) #unless @user.badges.include?(badge)
  end

  def all_tests_category(category)
    tests_category_count = Test.where(category_id: Category.find_by(title: category.to_s).id).count

    user_completed_tests_category = 0
    @user.test_passages.where(passed: true).pluck('DISTINCT test_id').each do |id|
      user_completed_tests_category += 1 if Test.find(id).category_id == Category.find_by(title: category.to_s).id
    end

    return tests_category_count == user_completed_tests_category
  end

  def all_tests_level(level)
    count_tests = Test.where(level: level.to_i).count

    user_count_tests = 0
    @user.test_passages.where(passed: true).pluck('DISTINCT test_id').each do |id|
      user_count_tests += 1 if Test.find(id).level == level.to_i
    end

    return count_tests == user_count_tests && count_tests != 0
  end

  def first_try_completed?
    count_tests = @user.test_passages.where(test_id: @test_passage.test.id).count
    return count_tests == 1 && @test_passage.passed == true
  end

end
