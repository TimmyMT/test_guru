module ApplicationHelper
  def year_now
    "Current year: #{Date.today.year}"
  end

  def author_repo
    link_to 'TimmyMT', 'https://github.com/TimmyMT/test_guru'
  end
end
