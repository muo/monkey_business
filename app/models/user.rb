class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true

  def admin?
    role == "admin"
  end

  def customer?
    role == "customer"
  end
end
