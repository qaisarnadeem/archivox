class CreateEventSessions < ActiveRecord::Migration
  def change
    create_table :event_sessions do |t|
      t.string :code
      t.string :title
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
