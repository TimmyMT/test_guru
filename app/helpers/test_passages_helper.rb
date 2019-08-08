module TestPassagesHelper
  def result_color(test_passage)
    test_passage
    if test_passage.succesful?
      'success'
    else
      'fail'
    end
  end
end
