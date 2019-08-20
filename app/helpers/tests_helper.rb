module TestsHelper
  def test_header(test)
    if test.new_record?
      "Create a new test"
    else
      "Edit #{test.title} test"
    end
  end

  def time_left_collection
    [3, 5, 7, 10, 15]
  end
end
