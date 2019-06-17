class AddColumnToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct, :boolean, default: false
  end
end
