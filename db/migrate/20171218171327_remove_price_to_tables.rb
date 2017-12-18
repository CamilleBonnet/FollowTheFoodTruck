class RemovePriceToTables < ActiveRecord::Migration[5.0]
  def change
    # remove
    remove_column :choices, :price
    remove_column :baskets, :total_price
    remove_column :meals, :price

    # add monetise column
    add_monetize :choices, :price, currency: { present: false }
    add_monetize :baskets, :total_price, currency: { present: false }
    add_monetize :meals, :price, currency: { present: false }
  end
end
