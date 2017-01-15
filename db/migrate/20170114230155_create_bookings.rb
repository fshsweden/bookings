class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :date_str
      t.integer :week
      t.string :from
      t.string :to
      t.string :activity
      t.string :team
      t.string :note
      t.string :zamboni
      t.string :comment

      t.timestamps
    end
  end
end
