class AddReadToReadOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :read_offers, :read, :boolean, default: false
  end
end
