class ChangeColumnsFromAuthors < ActiveRecord::Migration[5.2]
  def change
    change_column_default :authors, :user_id, null: false
  end
end
