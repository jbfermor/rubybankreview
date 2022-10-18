module TransferenceServices

  class ReceiverTransferenceCreateService < TransferenceSharedService
  
    def call
      Transference.create(amount: @amount, receiver: @receiver, sender: @sender, account_id: receiver_account(@receiver))
    end
  
  end

end
