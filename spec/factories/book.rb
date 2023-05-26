FactoryBot.define do
  factory :category do
    title { Faker::Book.title }
    author { Faker::Book.author }
    actegory { create(:category) }
  end
end
