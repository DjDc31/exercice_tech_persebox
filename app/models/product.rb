class Product < ApplicationRecord
  has_many_attached :images
  has_many :likes
  has_many :offers
  has_many :users, through: :likes
  has_many :users, through: :offers

  validates :marque, :modele, :content, presence: true
end
