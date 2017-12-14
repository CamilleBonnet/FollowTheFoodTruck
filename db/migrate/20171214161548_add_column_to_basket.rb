class AddColumnToBasket < ActiveRecord::Migration[5.0]
  def change
    add_reference :baskets, :truck, foreign_key: true
  end
end
