class AddSessionToSlots < ActiveRecord::Migration[5.1]
  def change
    add_reference :slots, :session, foreign_key: true
  end
end
