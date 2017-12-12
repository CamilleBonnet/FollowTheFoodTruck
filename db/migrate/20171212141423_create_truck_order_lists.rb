class CreateTruckOrderLists < ActiveRecord::Migration[5.1]
  def change
    create_table :truck_order_lists do |t|
      t.references :truck, foreign_key: true
      t.date :date
      t.datetime :time
      t.integer :total_day_income

      t.timestamps
    end
  end
end
