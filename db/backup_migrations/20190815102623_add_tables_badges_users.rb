class AddTablesBadgesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table "badges", force: :cascade do |t|
      t.string :name
      t.text :picture
      t.integer :control
      t.string :control_param

      t.timestamps
    end

    add_column :test_passages, :passed, :boolean

    create_table "badge_users", force: :cascade do |t|
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
