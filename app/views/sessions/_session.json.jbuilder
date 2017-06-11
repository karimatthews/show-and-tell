json.extract! session, :id, :name, :company, :about, :scheduled_at, :created_at, :updated_at
json.url session_url(session, format: :json)
