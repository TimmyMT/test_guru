class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body, null: false

      t.timestamps
    end
    add_reference :questions, :test, foreign_key: true
  end
end
