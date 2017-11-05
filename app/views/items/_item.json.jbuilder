json.extract! item, :id, :title, :category, :description, :problem, :item_photo_data, :created_at, :updated_at
json.url item_url(item, format: :json)
