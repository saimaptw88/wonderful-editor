FactoryBot.define do
  factory :comment do
    comment { Faker::Name.first_name }

    user
    article
  end
end
