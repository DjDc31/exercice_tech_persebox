# spec/features/products_index_spec.rb
require 'rails_helper'

feature "Products Index" do
  scenario "visitor sees the header for products" do
    visit products_path

    expect(page).to have_content("Nos produits")
  end

  scenario "visitor sees the header based on search query" do
    visit products_path(query: "Nintendo")

    expect(page).to have_content("Nos produits pour Nintendo")
  end

  scenario "visitor can filter products by brand" do
    product = create(:product, marque: "Nintendo")

    visit products_path
    all(:link, 'Nintendo')[0].click

    expect(page).to have_content(product.marque)
  end

  scenario "visitor sees no products message when no products are available" do
    visit products_path

    expect(page).to have_content("Aucun produit trouvé.")
  end

  scenario "visitor sees pagination if there are more than 12 products" do
    13.times { create(:product) }

    visit products_path

    expect(page).to have_link('2')
  end

  scenario "visitor does not see pagination if there are 12 or fewer products" do
    12.times { create(:product) }

    visit products_path

    expect(page).not_to have_link('2')
  end

end
