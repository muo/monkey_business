class User < ApplicationRecord
  devise :database_authenticatable
  include DeviseTokenAuth::Concerns::User
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
