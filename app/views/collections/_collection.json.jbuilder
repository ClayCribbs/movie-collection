json.extract! collection, :id, :user_id, :movie_id, :name, :created_at, :updated_at
json.url collection_url(collection, format: :json)
