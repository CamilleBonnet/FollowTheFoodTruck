class AddTokenToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :authentication_token, :string, limit: 30
    add_index :registrations, :authentication_token, unique: true
  end
end
