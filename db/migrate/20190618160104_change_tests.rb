class ChangeTests < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :title, false
    change_column_null :tests, :category_id, false
    change_column_default(:tests, :level, 1)
  end
end
