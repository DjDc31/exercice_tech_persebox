class Alert < ApplicationRecord
  belongs_to :user
  validates :keyword, presence: true
  has_many :read_offers


  def read?
    read
  end

  def offer_read?(offer)
    read_offers.exists?(offer_id: offer.id)
  end

  def unread_offers
    ReadOffer.where(user: user, alert: self, read: false)
  end


  def find_matching_offers
    scope = Offer.joins(:product).where("products.marque ILIKE :query OR products.modele ILIKE :query", query: "%#{self.keyword}%")
    scope = scope.where(language: self.language) if self.language.present?
    # Ajoutez d'autres critères de recherche ici si nécessaire
    scope
  end
end
