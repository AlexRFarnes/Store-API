FactoryBot.define do
  factory :product do
    name { Faker::Book.title }
    price { rand(1..1000) }
    description { Faker::Lorem.sentence(word_count: 50) }
    store 
  end
end
