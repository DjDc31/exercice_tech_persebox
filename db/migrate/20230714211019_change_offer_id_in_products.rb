class ChangeOfferIdInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :offer_id, true
  end
end
