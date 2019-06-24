class DropTableTestCreators < ActiveRecord::Migration[5.2]
  def change
    drop_table :test_creators
  end
end
