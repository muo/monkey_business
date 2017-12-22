class Basket < ApplicationRecord
  belongs_to :user, required: true
  has_many :basket_items
  has_many :items, through: :basket_items
end
