class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
