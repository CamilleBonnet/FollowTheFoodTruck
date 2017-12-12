class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.references :truck, foreign_key: true
      t.string :description
      t.boolean :is_vegan
      t.boolean :is_fat_free
      t.boolean :is_alergen
      t.boolean :is_gluten_free
      t.integer :spicy_scale
      t.float :price

      t.timestamps
    end
  end
end
