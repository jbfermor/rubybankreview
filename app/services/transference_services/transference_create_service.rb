module TransferenceServices

  class TransferenceCreateService

    attr_reader :amount, :sender, :receiver

    def initialize(amount, receiver, sender)
      @amount = amount
      @receiver = receiver
      @sender = sender
    end
  
    def call
      @sender_transference = Transference.new(amount: @amount, receiver: @receiver, sender: @sender, final_balance: sender_balance, account_id: sender_account.id)
      @receiver_transference = Transference.new(amount: @amount, receiver: @receiver, sender: @sender, final_balance: receiver_balance, account_id: receiver_account.id)
      receiver_account.with_lock do
        sender_account.with_lock do
          save_if_possible(@receiver_transference) if save_if_possible(@sender_transference)
        end
      end
    end 

    def sender_account
      User.find(@sender).account
    end
    
    def receiver_account
      User.find(@receiver).account
    end

    def sender_balance
      AccountServices::AccountSenderUpdateService.new(amount, sender_account.id).call
      sender_account.balance
    end

    def receiver_balance
      AccountServices::AccountReceiverUpdateService.new(amount, receiver_account.id).call
      receiver_account.balance
    end
  
    def different_users?
      @sender != @receiver
    end
  
    def balance_enough?
      sender_account.balance - @amount >= 0
    end

    def possible?
      different_users? && balance_enough?
    end

    def save_if_possible(transference)
      transference.save if possible?
    end

  end

end
