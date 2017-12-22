FactoryBot.define do
  factory :basket_item do
    association :basket
    association :item
  end
end
