require 'rails_helper'

RSpec.describe Account, type: :model do

  describe "validations" do
    let!(:user) { create(:user) }
    let(:account) { build(:account, user: user) }

    it "has valid attributes" do
      expect(account).to be_valid
    end

    it "should have a balance" do
      account = build(:account, balance: nil, user: user)
      expect(account).to_not be_valid
    end

    it "should have a user" do
      account = build(:account, user: nil)
      expect(account).to_not be_valid
    end

    it "account user should be valid" do
      user = build(:user, email: nil)
      account = build(:account, user: user)
      expect(account).to_not be_valid
    end

  end

end
