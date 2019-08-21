module TestsHelper

  def test_header(test)
    if test.new_record?
      "Create a new test"
    else
      "Edit #{test.title} test"
    end
  end

end
