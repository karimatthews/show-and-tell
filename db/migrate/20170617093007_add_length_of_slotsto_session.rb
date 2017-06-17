class AddLengthOfSlotstoSession < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :length_of_slots, :integer
  end
end
