class AddUniqueHashToSession < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :unique_hash, :string
  end
end
