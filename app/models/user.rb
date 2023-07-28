class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :chatrooms
  has_many :received_chatrooms, class_name: 'Chatroom', foreign_key: 'receiver_id'
  has_many :read_messages
  has_many :messages_read, through: :read_messages, source: :message


  before_validation :set_default_type
  validates :type, inclusion: { in: %w(User Admin) }

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :first_name, :last_name, :address, :type, presence: true
  validates :description, length: { maximum: 500 }
  validates :date_birth, presence: true

  private

  def set_default_type
    self.type ||= 'User'
  end

end
