module TransferenceServices

  class TransferenceCreateService < TransferenceReviewService
  
    def call
      Transference.create(amount: @amount, receiver: @receiver, sender: @sender, final_balance: receiver_balance, account_id: receiver_account.id)
      Transference.create(amount: @amount, receiver: @receiver, sender: @sender, final_balance: sender_balance, account_id: sender_account.id)
    end
  
  end

end
