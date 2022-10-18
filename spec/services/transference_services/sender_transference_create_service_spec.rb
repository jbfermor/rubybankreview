require 'rails_helper'

RSpec.describe TransferenceServices::SenderTransferenceCreateService do 

  let!(:sender) { create(:sender) }
  let!(:receiver) { create(:receiver) }
  let!(:sender_account) { create(:sender_account, user: sender) }
  let!(:receiver_account) { create(:receiver_account, user: receiver)}

  describe "call" do

    it "should create a transference from a sender" do
      transference = TransferenceServices::SenderTransferenceCreateService.new( 10, receiver.id, sender.id)
      expect{ transference.call }.to change{ Transference.count }.by(1)
    end

  end
  
end