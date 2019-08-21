class AddColumnTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timeleft, :integer
  end
end
