json.extract! booking_template_item, :id, :booking_template_id, :date_str, :week, :from, :to, :activity, :team, :note, :zamboni, :comment, :created_at, :updated_at
json.url booking_template_item_url(booking_template_item, format: :json)