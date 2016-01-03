json.array!(@event_sessions) do |event_session|
  json.extract! event_session, :id, :code, :title, :status, :created_by
  json.url event_session_url(event_session, format: :json)
end
