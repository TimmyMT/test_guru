class AddColumnTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :received_time, :integer
  end
end
