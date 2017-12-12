class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.references :basket, foreign_key: true
      t.references :meal, foreign_key: true
      t.references :truck, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity
      t.float :price
      t.date :date
      t.datetime :time

      t.timestamps
    end
  end
end
