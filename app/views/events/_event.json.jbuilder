json.extract! event, :id, :title, :datetime, :contents, :created_at, :updated_at
json.url event_url(event, format: :json)
