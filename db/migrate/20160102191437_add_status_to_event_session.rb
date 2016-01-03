class AddStatusToEventSession < ActiveRecord::Migration
  def change
    add_column :event_sessions, :status, :boolean,:default=>false
  end
end
