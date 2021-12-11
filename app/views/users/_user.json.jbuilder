json.extract! user, :id, :first_name, :last_name, :phone_number, :email, :goal, :education, :graduation_year, :created_at, :updated_at
json.url user_url(user, format: :json)
