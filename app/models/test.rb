class Test < ApplicationRecord

  def self.sort_on_category(name)
    Test.joins('join categories
    on tests.category_id = categories.id')
        .where(categories: { title: name })
        .order(title: :desc)
        .pluck(:title)
  end

end
