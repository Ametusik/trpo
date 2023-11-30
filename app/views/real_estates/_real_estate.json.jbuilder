json.extract! real_estate, :id, :name, :description, :price, :phone_number, :user_id, :created_at, :updated_at
json.url real_estate_url(real_estate, format: :json)
