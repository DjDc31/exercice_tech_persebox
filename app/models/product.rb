class Product < ApplicationRecord
  belongs_to :user

  validates :marque, :modele, :price, :content, :longueur, :hauteur, :largeur, :etat, :couleur, presence: true
  validates :price, numericality: { greater_than: 0 }
end
