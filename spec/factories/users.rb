FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    nickname { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_address }
    admin { false }
    date_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    description { Faker::Lorem.sentence }

    trait :admin do
      admin { true }
    end
  end
end
