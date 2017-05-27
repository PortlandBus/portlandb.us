require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#admin?" do
    it "check is user is an admin" do
      expect(User.new(admin: true).admin?).to be true
    end

    it "defaults to false" do
      expect(User.new.admin?).to be false
    end
  end
end
