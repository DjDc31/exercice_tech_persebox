class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :chatrooms
  has_many :received_chatrooms, class_name: 'Chatroom', foreign_key: 'receiver_id'
  # has_many :read_messages
  has_many :messages_read, through: :read_messages, source: :message
  has_one_attached :avatar


  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :first_name, :last_name, :address, presence: true
  validates :description, length: { maximum: 500 }
  validates :date_birth, presence: true

  def admin?
    self.admin
  end

end
