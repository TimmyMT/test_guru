class AddColumnTimeToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :time_over, :boolean, default: false
  end
end
