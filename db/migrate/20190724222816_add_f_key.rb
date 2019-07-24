class AddFKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :gists, :user, foreign_key: true
    add_reference :gists, :question, foreign_key: true
  end
end
