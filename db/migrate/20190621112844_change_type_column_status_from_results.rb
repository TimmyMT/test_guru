class ChangeTypeColumnStatusFromResults < ActiveRecord::Migration[5.2]
  def change
    change_column :results, :status, :boolean, default: false
  end
end
