json.extract! lesson, :id, :name, :objective_id, :content, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)