class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
