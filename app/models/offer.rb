class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true
  validates :content, :price, presence: true

  validates :price, numericality: { greater_than: 0 }

end
