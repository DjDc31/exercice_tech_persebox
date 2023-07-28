class AddOfferToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :offer, foreign_key: true, null: true
  end
end
