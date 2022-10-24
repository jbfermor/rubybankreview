require 'rails_helper'

RSpec.describe TransferenceServices::TransferenceReviewService do 

  let!(:sender) { create(:sender) }
  let!(:receiver) { create(:receiver) }

  describe "review actions" do

    it "get sender Account" do
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.sender_account).to eq(sender.account)
    end

    it "get receiver Account" do
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.receiver_account).to eq(receiver.account)
    end

    it "review if sender and receiver are different" do
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.different_users?).to be(true)
    end

  end
  
  describe "reviews with account operations" do

    let!(:sender_account) { create(:account, balance: 100, user: sender) }
    let!(:receiver_account) { create(:account, balance: 100, user: receiver) }

    it "review if sender balance is higher or equal than amount" do  
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.balance_enough?).to be(true)
    end

    it "review if transference is possible" do 
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.possible?).to be(true)
    end

    it "get sender final balance" do
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.sender_balance).to eq(90)
    end

    it "get receiver final balance" do
      transference = TransferenceServices::TransferenceReviewService.new( 10, receiver.id, sender.id)
      expect(transference.receiver_balance).to eq(110)
    end

  end
  
end