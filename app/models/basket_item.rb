class BasketItem < ApplicationRecord
  belongs_to :basket, required: true
  belongs_to :item, required: true
end
