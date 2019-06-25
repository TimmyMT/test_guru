class AddRefCreatorToTests < ActiveRecord::Migration[5.2]
  def change
    # add_reference :tests, :creator, references: :users, index: true
    add_reference :tests, :creator, foreign_key: { to_table: :users }
  end
end
