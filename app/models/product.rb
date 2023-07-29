class Product < ApplicationRecord
  has_many_attached :images
  has_many :likes
  has_many :offers
  has_many :liked_users, through: :likes, source: :user
  has_many :offering_users, through: :offers, source: :user
  attr_accessor :images_remove

  validates :marque, :modele, :content, presence: true

  def images_remove=(values)
    values.each do |id, remove|
      image = images.find(id)
      image.purge if ActiveModel::Type::Boolean.new.cast(remove)
    end
  end

  # validates :images, presence: true, on: :create

  before_update :purge_images

  def purge_images
    Array(images_remove).each do |id, should_remove|
      images.find(id).purge if should_remove == 'true'
    end
  end


  private

  def at_least_one_image
    if images.none? && Array(images_remove).all? { |_id, should_remove| should_remove == 'true' }
      errors.add(:images, 'doit être présent')
    end
  end

end
