class AddOfferToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :offer, null: false, foreign_key: true
  end
end
