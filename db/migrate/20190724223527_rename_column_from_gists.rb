class RenameColumnFromGists < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :gist_url, :url
  end
end
