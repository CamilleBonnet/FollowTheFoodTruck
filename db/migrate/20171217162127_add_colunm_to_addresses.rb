class AddColunmToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :active_address, :boolean
  end
end
