module TransferenceServices
  
  class SenderTransferenceCreateService < TransferenceSharedService
  
    def call
      Transference.create(amount: @amount, receiver: @receiver, sender: @sender, account_id: receiver_account(@sender))
    end

  end

end
