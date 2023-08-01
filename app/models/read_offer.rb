class ReadOffer < ApplicationRecord
  belongs_to :user
  belongs_to :alert
  belongs_to :offer
end
