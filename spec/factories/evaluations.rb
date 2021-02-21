FactoryBot.define do
  factory :evaluation do
    eval { Faker::Number.decimal_part(digits: 2) }

    user
    article
  end
end
