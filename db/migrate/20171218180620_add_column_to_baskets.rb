class AddColumnToBaskets < ActiveRecord::Migration[5.0]
  def change
    add_column :baskets, :payment, :jsonb
  end
end
