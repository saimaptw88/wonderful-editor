FactoryBot.define do
  factory :article do
    sequence(:title) { Faker::Book.title }
    sequence(:body) { Faker::Books::CultureSeries.book }

    user
  end
end
