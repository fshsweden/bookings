class CreateBookingTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_templates do |t|
      t.string :name
      t.string :creator
      t.date :created_at

      t.timestamps
    end
  end
end
