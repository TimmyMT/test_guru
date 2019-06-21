class ChangeColumnFromTests < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, nil)
  end
end
