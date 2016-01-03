class Question < ActiveRecord::Base
  belongs_to :event_session
  validates_presence_of :description,:event_session_id
end
