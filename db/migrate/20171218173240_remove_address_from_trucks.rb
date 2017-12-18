class RemoveAddressFromTrucks < ActiveRecord::Migration[5.0]
  def change
    remove_column :trucks, :address_id
  end
end
