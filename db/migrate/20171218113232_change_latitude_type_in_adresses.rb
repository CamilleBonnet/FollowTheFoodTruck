class ChangeLatitudeTypeInAdresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :latitude, :float
  end
end
