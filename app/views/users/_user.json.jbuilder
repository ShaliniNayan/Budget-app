json.extract! user, :id, :name, :bio, :profile_picture, :created_at, :updated_at
json.url user_url(user, format: :json)
