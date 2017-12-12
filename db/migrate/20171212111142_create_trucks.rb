class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :type_of_food
      t.boolean :pay_online
      t.string :payment_info

      t.timestamps
    end
  end
end
