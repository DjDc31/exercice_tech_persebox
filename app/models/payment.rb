class Payment < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true
  validates :status, presence: true, inclusion: { in: %w(completed canceled) }
end
