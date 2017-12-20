class AddDescriptionToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :description, :text, default: ""
  end
end
