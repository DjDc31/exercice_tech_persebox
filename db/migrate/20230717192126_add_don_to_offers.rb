class AddDonToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :don, :boolean
    add_column :offers, :default, :string
    add_column :offers, :false, :string
  end
end
