FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Company #{n}" }
    status { 'Status' }
    client { create(:client) }
  end
end
