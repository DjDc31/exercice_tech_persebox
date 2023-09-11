FactoryBot.define do
  factory :product do
    marque { ['Sony', 'Nintendo', 'Nike', 'Moulinex', 'Louis Vuitton', 'Hermès'].sample }
    modele { Faker::Lorem.words(number: 2).join(' ') }
    content { Faker::Lorem.sentence }
    couleur { Faker::Color.color_name }
  end
end
