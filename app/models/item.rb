class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :category, required: true
  has_many :basket_items
  has_many :baskets, through: :basket_items
end
