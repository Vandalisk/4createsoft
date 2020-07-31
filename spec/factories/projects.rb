FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Company #{n}" }
    status { 'Status' }
  end
end
