require 'rails_helper'

RSpec.describe UserServices::UserCreateService, type: :model do
  describe "call" do
    it "should create a user" do
      instance = UserServices::UserCreateService.new("john2@doe.com", "password")
      expect{ instance.call }.to change { User.count }.by(1)
    end
  end
end
