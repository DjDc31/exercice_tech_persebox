class ChangeOfferIdNullInChatrooms < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chatrooms, :offer_id, false
  end
end
