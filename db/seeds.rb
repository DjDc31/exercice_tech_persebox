# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Supprimer tous les utilisateurs existants

# ReadMessage.destroy_all
Message.destroy_all
Like.destroy_all
Chatroom.destroy_all
Offer.destroy_all

Product.destroy_all
User.destroy_all


# Réinitialiser la mémoire de Faker
Faker::UniqueGenerator.clear

puts "Creating Admins..."
#Generation des Admins
User.create!(
  email: 'cyrille.varin@live.fr',
  password: '123456',
  nickname: 'Cycy',
  first_name: 'Cyrille',
  last_name: 'Varin',
  address: 'place verdun, 64000, Pau',
  admin: true,
  date_birth: Date.new(1989, 9, 26),
  description: 'This is a description for user1'
)

lolo = User.create!(
  email: 'lolodu35@gmail.com',
  password: '123456',
  nickname: 'Lolo',
  first_name: 'Laurène',
  last_name: 'Freyer',
  address: 'Rennes',
  admin: true,
  date_birth: Date.new(1992, 1, 1),
  description: 'This is a description for user2'
)

file = URI.open('https://avatars.githubusercontent.com/u/131400108?v=4')
lolo.avatar.attach(io: file, filename: 'lolo_freyer.jpg', content_type: 'image/jpg')

puts "Creating Users..."
# Créer de nouveaux utilisateurs

# Créer 20 utilisateurs aléatoires
20.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    nickname: Faker::Internet.unique.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    date_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    description: Faker::Lorem.sentence
  )
end

puts "Creating Products..."

# Créer un nouveau produit
product_ps5 = Product.create!(
  marque: 'Sony',
  modele: 'PS5',
  content: 'Boîte de PS5 classique',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Blanc', # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_ps5.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365506/ps5-boite-packaging_duvgge.jpg'), filename: 'ps5-boite-packaging_duvgge.jpg', content_type: 'image/jpg')

# Créer un nouveau produit pour la boîte de la PS1
product_ps1 = Product.create!(
  marque: 'Sony',
  modele: 'PS1',
  content: 'Boîte de PS1 classique.',
  couleur: 'Gris'
)

# Attacher une image à ce produit
product_ps1.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690461353/8ce1671db623cbfd3f73bca986d7b1f3_puhetm.jpg'), filename: 'ps1-boite.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_switch = Product.create!(
  marque: 'Nintendo',
  modele: 'Switch Lite Animal Crossing',
  content: 'Boîte de Nintendo Switch Lite édition Animal Crossing.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Rose' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_switch.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689370300/nintendo-switch-lite-coreil-et-animal-crossing_gsxpht.jpg'), filename: 'nintendo-switch-lite-coreil-et-animal-crossing_gsxpht.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_ps5_digital = Product.create!(
  marque: 'Sony',
  modele: 'PS5 Digital Edition',
  content: 'Boîte de PS5 Digital Edition.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Noir' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_ps5_digital.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689370780/ps5-digital-console-front-box-eu_a4joaq.jpg'), filename: 'ps5-digital-console-front-box-eu_a4joaq.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_pokemon_green = Product.create!(
  marque: 'Nintendo',
  modele: 'Game Boy Pokémon Rouge',
  content: 'Boîte pour cartouche de Game Boy Pokémon Rouge.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Rouge' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_pokemon_green.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690461148/Pokemon-Red-Version-_USA_-Europe__g4yyzu.jpg'), filename: 'gb-pokemon-red.jpg_jzest0.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_nintendo_64 = Product.create!(
  marque: 'Nintendo',
  modele: 'Nintendo 64',
  content: 'Boîte pour console Nintendo 64.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Gris' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_nintendo_64.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690460221/Console-Nintendo-64-N64-PAL-avec-boite-dorigine-removebg-preview_jpohxr.png'), filename: 'nintendo64.jpg_wnsq7t.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_pokemon_blue = Product.create!(
  marque: 'Nintendo',
  modele: 'Game Boy Pokémon Bleu',
  content: 'Boîte pour cartouche de Game Boy Pokémon Bleu.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Bleu' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_pokemon_blue.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690461148/Pokemon-Blue-Version-_USA_-Europe__qxhmbk.jpg'), filename: 'gb-pokemon-blue.jpg_jlpcvm.jpg', content_type: 'image/jpg')

product_nike_shoes = Product.create!(
  marque: 'Nike',
  modele: 'Classic Red/black',
  content: 'Boîte pour Chaussure Nike.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Noir' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_nike_shoes.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690460222/noname_15.png_iefh3g.jpg'), filename: 'nike_shoes.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_ps4 = Product.create!(
  marque: 'Sony',
  modele: 'PS4 500Go',
  content: 'Boîte pour console PS4 version 500Go.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Blanche' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_ps4.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365505/ps4_blanche_500go_zf2ozz.jpg'), filename: 'ps4_blanche_500go_zf2ozz.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_pokemon_or = Product.create!(
  marque: 'Nintendo',
  modele: 'Nintendo 3DS Pokémon Or',
  content: 'Boîte pour cartouche Nintendo 3DS Pokémon version Or.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Or' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_pokemon_or.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365505/n3ds_pokemon_or_fr_nsk5xi.jpg'), filename: 'n3ds_pokemon_or_fr_nsk5xi.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_louis_vuitton = Product.create!(
  marque: 'Louis Vuitton',
  modele: '27x13x36',
  content: 'Boîte Louis Vuitton de dimensions 27x13x36.',
  longueur: 27,
  hauteur: 13,
  largeur: 36,
  couleur: 'Orange' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_louis_vuitton.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365505/lv-27_13_36_e47tsy.jpg'), filename: 'lv-27_13_36_e47tsy.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_cookeo = Product.create!(
  marque: 'Moulinex',
  modele: 'Cookeo',
  content: 'Boîte pour Moulinex Cookeo.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Blanc' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_cookeo.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365505/moulinex_cookeo_blanc_szpmfq.jpg'), filename: 'moulinex_cookeo_blanc_szpmfq.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_louis_vuitton = Product.create!(
  marque: 'Louis Vuitton',
  modele: '13x7x3',
  content: 'Boîte Louis Vuitton de dimensions 13x7x3.',
  longueur: 13,
  hauteur: 7,
  largeur: 3,
  couleur: 'Orange' # Mettez la couleur que vous voulez
)

# Attacher la première image au produit
product_louis_vuitton.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365505/lv-13_7_3_ztzct5.jpg'), filename: 'lv-13_7_3_ztzct5.jpg', content_type: 'image/jpg')

# Attacher la deuxième image au produit
product_louis_vuitton.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/lv-13_7_3_2_kran0b.jpg'), filename: 'lv-13_7_3_2_kran0b.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_hermes = Product.create!(
  marque: 'Hermès',
  modele: '9x18x4',
  content: 'Boîte Hermès de dimensions 9x18x4.',
  longueur: 9,
  hauteur: 18,
  largeur: 4,
  couleur: 'Orange' # Mettez la couleur que vous voulez
)

# Attacher la première image au produit
product_hermes.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/hermes-9_18_4_2_gzeqfc.jpg'), filename: 'hermes-9_18_4_2_gzeqfc.jpg', content_type: 'image/jpg')

# Attacher la deuxième image au produit
product_hermes.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/hermes-9_18_4_3_jjjk0f.jpg'), filename: 'hermes-9_18_4_3_jjjk0f.jpg', content_type: 'image/jpg')

# Attacher la troisième image au produit
product_hermes.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/hermes-9_18_4_vprkwp.jpg'), filename: 'hermes-9_18_4_vprkwp.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_beaba_milkeo = Product.create!(
  marque: 'Beaba',
  modele: 'Milkeo',
  content: 'Boîte Beaba Milkeo.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Bleu' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_beaba_milkeo.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/beaba_milkeo_boite_bdzxny.jpg'), filename: 'beaba_milkeo_boite_bdzxny.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_macbook_pro = Product.create!(
  marque: 'Apple',
  modele: 'MacBook Pro 13 pouces ',
  content: 'Boîte Apple MacBook Pro 13 pouces silver (2016-2020).',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Blanc' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_macbook_pro.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/apple_macbook_pro_13.3_silver_2016_20_oxq7gi.jpg'), filename: 'apple_macbook_pro_13.3_silver_2016_20_oxq7gi.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_wii = Product.create!(
  marque: 'Nintendo',
  modele: 'Wii',
  content: 'Boîte Nintendo Wii.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Blanc' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_wii.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1689365504/console-wii_qq87jt.jpg'), filename: 'console-wii_qq87jt.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_iphone_11 = Product.create!(
  marque: 'Apple',
  modele: 'iPhone 11 Black',
  content: 'Boîte Apple iPhone 11 noir.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Noir' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_iphone_11.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690460222/istockphoto-887890654-170667a_ieaufs.jpg'), filename: 'apple_iphone11_black_ucyc7b.jpg', content_type: 'image/jpg')

# Créer un nouveau produit
product_air_jordan = Product.create!(
  marque: 'Nike',
  modele: 'Air Jordan',
  content: 'Boîte de chaussure Nike Air Jordan.',
  # longueur: 35, # Mettez les dimensions que vous voulez
  # hauteur: 20,
  # largeur: 10,
  couleur: 'Noir' # Mettez la couleur que vous voulez
)

# Attacher une image au produit
product_air_jordan.images.attach(io: URI.open('https://res.cloudinary.com/dxe8z0dsb/image/upload/v1690460222/mini-boite-sneakers-jordan_erfpqg.jpg'),filename: 'nike_jordan.jpg', content_type: 'image/jpg')


puts "Creating Offers..."

# Sélectionner deux utilisateurs existants
user1 = User.first
user2 = User.second

# Créer des offres pour le produit
offer1 = Offer.create!(user: user1, product: product_ps5, price: 39.99, extra: true, content: 'Avec en extra le moule cartonné pour la console.', language: 'fr', etat: 'Neuf_deja_utilisee')
offer2 = Offer.create!(user: user2, product: product_ps5, price: 35, extra: false, content: 'Offre 2', language: 'en', etat: 'Bon_etat')

# ...

users = User.all
products = Product.all
etats = [
  'Neuf_jamais_utilisee',
  'Neuf_deja_utilisee',
  'Tres_bon_etat',
  'Bon_etat',
  'Satisfaisant',
  'Abime'
]

users.each do |user|
  products.each do |product|
    offer = Offer.create!(
      user: user,
      product: product,
      price: Faker::Commerce.price(range: 5.50..55),
      extra: Faker::Boolean.boolean,
      content: Faker::Lorem.sentence,
      language: Offer.language_options.sample[1],
      etat: etats.sample
    )
  end
end

puts "Creating Likes..."

users = User.all
products = Product.all

products.each do |product|
  # Sélectionner un nombre aléatoire de likes pour chaque produit
  num_likes = rand(1..5)

  # Sélectionner des utilisateurs aléatoires pour les likes
  liked_users = users.sample(num_likes)

  # Ajouter les likes pour le produit
  liked_users.each do |user|
    product.likes.create(user: user)
  end
end

puts "Terminé !"
