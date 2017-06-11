class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :company
      t.string :about
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
