class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User"
  belongs_to :offer
  has_many :messages, dependent: :destroy

end
