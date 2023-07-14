class RemovePhotoFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :photo, :string
  end
end
