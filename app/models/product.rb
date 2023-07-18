class Product < ApplicationRecord
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :offers

  validates :marque, :modele, :content, presence: true
end
