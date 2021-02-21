FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { "123456" }
  end
end
