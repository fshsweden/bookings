json.extract! booking, :id, :date_str, :week, :from, :to, :activity, :team, :note, :zamboni, :comment, :created_at, :updated_at
json.url booking_url(booking, format: :json)