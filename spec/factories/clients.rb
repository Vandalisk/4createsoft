FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "Client #{n}" }
  end
end
