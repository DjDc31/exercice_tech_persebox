# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Supprimer tous les utilisateurs existants
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
  type: 'Admin',
  date_birth: Date.new(1989, 9, 26),
  description: 'This is a description for user1'
)

User.create!(
  email: 'lolodu35@gmail.com',
  password: '123456',
  nickname: 'Lolo',
  first_name: 'Lauréne',
  last_name: 'Freyer',
  address: 'Rennes',
  type: Admin,
  date_birth: Date.new(1992, 1, 1),
  description: 'This is a description for user2'
)

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
    type: User,
    date_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    description: Faker::Lorem.sentence
  )
end

puts "Terminé !"
