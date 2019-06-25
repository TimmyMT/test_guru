class AddRefCreatorToTests < ActiveRecord::Migration[5.2]
  def change
    # add_reference :tests, column: :creator_id, foreign_key: true
    add_reference :tests, :creator, references: :users, index: true
  end
end
