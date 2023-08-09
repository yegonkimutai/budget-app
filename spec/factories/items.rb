FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    amount { 100 }
    association :group
    association :author, factory: :user
  end
end
