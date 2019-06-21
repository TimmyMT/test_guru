class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
    add_reference :answers, :question, foreign_key: true
  end
end
