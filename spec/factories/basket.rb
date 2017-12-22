FactoryBot.define do
  factory :basket do
    association :user

    trait :with_items do
      items { build_list(:item, 2) }
    end
  end
end
