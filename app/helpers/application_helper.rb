module ApplicationHelper
  def year_now
    "Current year: #{Date.current.year}"
  end

  def author_repo(author, repo)
    link_to "#{author}", "#{repo}", target: :_blank
  end
end
