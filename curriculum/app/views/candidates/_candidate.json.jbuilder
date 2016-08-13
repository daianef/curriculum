json.extract! candidate, :id, :first_name, :last_name, :middle_name, :email, :homepage, :github, :linkedin, :goal, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)