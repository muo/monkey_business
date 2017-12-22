require "rails_helper"

RSpec.describe User, type: :model do
  describe "#admin?" do
    it "returns true when user has role admin" do
      user = create(:user, role: "admin")
      expect(user.admin?).to eq true
    end

    it "returns false when user doesn't have role admin" do
      user = create(:user, role: "customer")
      expect(user.admin?).to eq false
    end
  end

  describe "#customer?" do
    it "returns true when user has role customer" do
      user = create(:user, role: "customer")
      expect(user.customer?).to eq true
    end

    it "returns false when user doesn't have role customer" do
      user = create(:user, role: "admin")
      expect(user.customer?).to eq false
    end
  end
end
