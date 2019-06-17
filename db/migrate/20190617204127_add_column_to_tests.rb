class AddColumnToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :level, :integer, default: 1
  end
end
