# ------------------------------------------------------------------
#
#
# ------------------------------------------------------------------

class BookingItem < ApplicationRecord

  self.table_name = "bookings"
  before_validation :calculate_week

  # Validate that all fields are given!
  BookingItem.columns.each do |column|
   unless ["id", "note", "comment", "created_at","updated_at"].include? column.name
     validates column.name,  presence: true
   end
  end

private

  def calculate_week
    self[:week] = self[:date_str].to_datetime.cweek
  end

end
