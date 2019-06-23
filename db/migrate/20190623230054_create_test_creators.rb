class CreateTestCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :test_creators do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
