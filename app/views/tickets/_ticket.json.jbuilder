json.extract! ticket, :id, :user, :title, :assign, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
