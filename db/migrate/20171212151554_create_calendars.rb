class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.references :address, foreign_key: true
      t.date :starting_date
      t.date :ending_date

      t.timestamps
    end
  end
end
