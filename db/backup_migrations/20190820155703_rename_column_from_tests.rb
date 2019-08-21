class RenameColumnFromTests < ActiveRecord::Migration[5.2]
  def change
    rename_column :tests, :received_time, :timeleft
  end
end
