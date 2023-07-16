class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true
  validates :content, :price, presence: true

  validates :price, numericality: { greater_than: 0 }
  validates_inclusion_of :etat, in: %w[Neuf_jamais_utilisee Neuf_deja_utilisee Tres_bon_etat Bon_etat Satisfaisant Abime]
end
