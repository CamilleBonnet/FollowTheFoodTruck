class ChangeLongitudeTypeInAdresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :longitude, :float
  end
end
