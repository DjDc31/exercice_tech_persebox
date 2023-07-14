class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :first_name, :last_name, :address, :type, presence: true
  validates :description, length: { maximum: 500 }
  validates :date_birth, presence: true

end
