module TransferenceServices

  class TransferenceCreateService < TransferenceReviewService
  
    def call

      receiver_account.with_lock do

        sender_account.with_lock do
          
          @sender_transference = Transference.new(amount: @amount, receiver: @receiver, sender: @sender, final_balance: sender_balance, account_id: sender_account.id)
          if @sender_transference.save
            Transference.create(amount: @amount, receiver: @receiver, sender: @sender, final_balance: receiver_balance, account_id: receiver_account.id)
          end

        end

      end

    end
  
  end

end
