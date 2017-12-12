class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :role
      t.references :registration, foreign_key: true

      t.timestamps
    end
  end
end
