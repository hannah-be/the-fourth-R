json.extract! profile, :id, :user_id, :name, :phone, :profile-photo-data, :address_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
