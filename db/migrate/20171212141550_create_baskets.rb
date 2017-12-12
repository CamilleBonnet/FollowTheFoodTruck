class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.references :user, foreign_key: true
      t.references :truck_order_list, foreign_key: true
      t.integer :total_price
      t.date :date
      t.datetime :time
      t.string :status

      t.timestamps
    end
  end
end
