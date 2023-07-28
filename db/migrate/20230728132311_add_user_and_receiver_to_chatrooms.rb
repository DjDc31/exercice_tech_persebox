class AddUserAndReceiverToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :user_id, :integer
    add_column :chatrooms, :receiver_id, :integer
  end
end
