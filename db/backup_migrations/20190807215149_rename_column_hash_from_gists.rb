class RenameColumnHashFromGists < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :hash, :gist_hash
  end
end
