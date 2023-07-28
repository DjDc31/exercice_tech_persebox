class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :read_messages
  has_many :readers, through: :read_messages, source: :user
  has_one_attached :image


end
