class AddRefToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_reference :authors, :user, foreign_key: true
  end
end
