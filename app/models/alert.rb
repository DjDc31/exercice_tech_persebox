class Alert < ApplicationRecord
  belongs_to :user
  validates :keyword, presence: true

  def find_matching_offers
    scope = Offer.joins(:product).where("products.marque ILIKE :query OR products.modele ILIKE :query", query: "%#{self.keyword}%")
    scope = scope.where(language: self.language) if self.language.present?
    # Ajoutez d'autres critères de recherche ici si nécessaire
    scope
  end
end
