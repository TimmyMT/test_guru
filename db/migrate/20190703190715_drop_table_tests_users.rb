class DropTableTestsUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :tests_users
  end
end
