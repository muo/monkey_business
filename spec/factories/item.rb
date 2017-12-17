FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    association :category, factory: :category
  end
end
