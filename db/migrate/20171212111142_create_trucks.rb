class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :type_of_food
      t.boolean :pay_online
      t.string :payment_info

      t.timestamps
    end
  end
end
