FactoryBot.define do
  factory :post do
    content { Faker::Lorem.sentence(word_count: 10) }
  end
end