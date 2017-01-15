class CreateBookingTemplateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_template_items do |t|
      t.string :booking_template_id
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
