FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Brian Yegon #{n}" }
    sequence(:email) { |n| "aa.cc#{n}@example.com" }
    password { 'password' }
  end
end
