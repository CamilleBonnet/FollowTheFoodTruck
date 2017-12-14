class RemoveColumnFromChoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :choices, :truck_id, :integer
  end
end
