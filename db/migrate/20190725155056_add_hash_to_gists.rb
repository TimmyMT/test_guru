class AddHashToGists < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :hash, :string
  end
end
