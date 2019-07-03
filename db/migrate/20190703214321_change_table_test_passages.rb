class ChangeTableTestPassages < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:test_passages, :current_question_id, nil)
  end
end
