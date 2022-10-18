require 'rails_helper'

RSpec.describe Transference, type: :model do
  
  let!(:user) { create(:user) }
  let!(:account) { create(:account, user: user) }

  describe 'validations' do

    let(:transference) { build(:transference, account: account) }

    it "has valid attributes" do
      expect(transference).to be_valid
    end

    it "should have an amount" do
      transference = build(:transference, amount: nil)
      expect(transference).to_not be_valid
    end

    it "should have a receiver" do
      transference = build(:transference, receiver: nil)
      expect(transference).to_not be_valid
    end

    it "should have an account" do
      transference = build(:transference, account: nil)
      expect(transference).to_not be_valid
    end

    it "should have a valid account" do
      account = build(:account, user: nil)
      transference = build(:transference, account: account)
      expect(transference).to_not be_valid
    end
    
  end

  describe "console create action" do

    it "console_create_transference" do

      expect { Transference.console_create_transference( 10, user.email ) }.to change{ Transference.count }.by(1)

    end
    
  end
  
end
