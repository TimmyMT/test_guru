class AddRefCreatorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :creator, foreign_key: true
  end
end
