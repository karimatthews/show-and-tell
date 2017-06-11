class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.string :topic
      t.string :speaker
      t.string :description

      t.timestamps
    end
  end
end
