FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "Client #{n}" }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
