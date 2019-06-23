class DeleteColumnAuthorFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :author_id
  end
end
