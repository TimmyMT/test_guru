class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.text :status, null: false

      t.timestamps
    end
    add_reference :results, :test, foreign_key: true
    add_reference :results, :user, foreign_key: true
  end
end
