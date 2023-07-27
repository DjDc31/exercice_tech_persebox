class Product < ApplicationRecord
  has_many_attached :images
  has_many :likes
  has_many :offers
  has_many :liked_users, through: :likes, source: :user
  has_many :offering_users, through: :offers, source: :user

  validates :marque, :modele, :content, presence: true
end
