require 'rails_helper'

RSpec.describe AccountServices::AccountCreateService, type: :model do
  describe "call" do
    it "should create an account to an user" do
      user1 = create(:user)
      instance = AccountServices::AccountCreateService.new(100, user1)
      expect{ instance.call }.to change { Account.count }.by(1)
    end
  end
end
