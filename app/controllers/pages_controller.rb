class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @random_products = Product.all.sample(6)
    @most_liked_products = Product.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(6)
  end

  def contact
  end
end
