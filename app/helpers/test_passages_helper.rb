module TestPassagesHelper
  def completed_message(test_passage)
    if test_passage.succesful?
      t('test_passages.result.header.success', title: test_passage.test.title)
    else
      t('test_passages.result.header.fail', title: test_passage.test.title)
    end
  end

  def result_color(test_passage)
    if test_passage.succesful?
      'success'
    else
      'fail'
    end
  end
end
