class AddColumnToCalendars < ActiveRecord::Migration[5.0]
  def change
    add_reference :calendars, :truck, foreign_key: true
  end
end
