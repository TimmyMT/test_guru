class DropColumnFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :test_id
    add_reference :tests, :author, foreign_key: true
  end
end
