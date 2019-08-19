module ApplicationHelper
  def year_now
    "#{Date.current.year}"
  end

  def author_repo(author, repo)
    link_to "#{author}", "https://github.com/#{author}/#{repo}", target: :_blank, class: 'card-link text-warning'
  end

  def current_time_now
    Time.now
  end
end
