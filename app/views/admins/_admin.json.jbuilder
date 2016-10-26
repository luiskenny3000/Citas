json.extract! admin, :id, :name, :last_name, :email, :telephone, :password, :center_id, :created_at, :updated_at
json.url admin_url(admin, format: :json)