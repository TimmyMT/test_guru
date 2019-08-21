class ForHerokuAddTalblesAndColumns < ActiveRecord::Migration[5.2]
  def change
    create_table "badge_users", force: :cascade do |t|
      t.bigint "user_id"
      t.bigint "badge_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["badge_id"], name: "index_badge_users_on_badge_id"
      t.index ["user_id"], name: "index_badge_users_on_user_id"
    end

    create_table "badges", force: :cascade do |t|
      t.string "name"
      t.text "picture"
      t.integer "control"
      t.string "control_param"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_column :test_passages, :passed, :boolean
    add_column :test_passages, :time_over, :boolean, default: false
    add_column :tests, :timeleft, :integer
  end
end
