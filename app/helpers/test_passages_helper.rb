module TestPassagesHelper
  def color_percent(test_passage)
    if test_passage.result_percent >= 85
      color = 'green'
    elsif test_passage.result_percent < 85
      color = 'red'
    end
    "<span style=\"color: #{color}\">#{test_passage.result_percent}%</span>"
  end
end
