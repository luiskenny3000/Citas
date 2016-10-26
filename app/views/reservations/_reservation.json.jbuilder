json.extract! reservation, :id, :description, :teacher_id, :room_id, :observation_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)