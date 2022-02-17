json.extract! user, :id, :username, :encrypted_password, :email, :mobile, :salt, :group, :email_comfirmed, :two_factor, :created_at, :updated_at
json.url user_url(user, format: :json)
