class AddColumnToTruck < ActiveRecord::Migration[5.0]
  def change
    add_reference :trucks, :address, foreign_key: true
  end
end
