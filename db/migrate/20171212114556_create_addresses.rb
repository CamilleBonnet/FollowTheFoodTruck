class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :truck, foreign_key: true
      t.text :street_address
      t.text :street_address_2
      t.string :city
      t.integer :zipcode
      t.string :country
      t.text :more_info
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
