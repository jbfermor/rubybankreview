require 'rails_helper'

RSpec.describe TransferenceServices::TransferenceCreateService do 

  let!(:sender) { create(:sender) }
  let!(:receiver) { create(:receiver) }
  let!(:sender_account) { create(:sender_account, user: sender) }
  let!(:receiver_account) { create(:receiver_account, user: receiver)}

  describe "call" do

    it "should create a transference" do
      transference = TransferenceServices::TransferenceCreateService.new( 10, receiver.id, sender.id)
      expect{ transference.call }.to change{ Transference.count }.by(2)
    end

  end
  
end