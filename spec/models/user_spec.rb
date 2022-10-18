require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validations" do
    
    let(:user) { build(:user) }

    it "should have valid params" do
      expect(user).to be_valid
    end

    it "should have a mail" do
      user = User.new(password: "password")
      expect(user).to_not be_valid
    end

    it "should have a password" do
      user = User.new(email: "john@doe.com")
      expect(user).to_not be_valid
    end

    it "should have a unique email" do
      user1 = create(:user)
      user2 = build(:user)
      expect(user2).to_not be_valid
    end

  end 

  describe "console create action" do
  
    it "should create a new user with an account" do

      expect { User.create_console_user("john@doe.com", "password") }.to change{ User.count }.by(1)
      expect { User.create_console_user("john2@doe.com", "password") }.to change{ Account.count }.by(1)
      
    end

  end

end
