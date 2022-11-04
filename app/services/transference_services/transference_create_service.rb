module TransferenceServices

  class TransferenceCreateService

    attr_reader :amount, :sender, :receiver

    def initialize(amount, receiver, sender)
      @amount = amount
      @receiver = receiver
      @sender = sender
    end
  
    def call
      @sender_transference = Transference.new(amount: @amount, receiver: @receiver, sender: @sender, final_balance: sender_balance_update, account_id: sender_account.id)
      @receiver_transference = Transference.new(amount: @amount, receiver: @receiver, sender: @sender, final_balance: receiver_balance_update, account_id: receiver_account.id)
      receiver_account.with_lock do
        sender_account.with_lock do
          save_receiver_if_possible(@receiver_transference) if save_sender_if_possible(@sender_transference)
        end
      end
    end 

    def sender_account
      User.find(@sender).account
    end
    
    def receiver_account
      User.find(@receiver).account
    end

    def sender_balance_update
      sender_account.balance - amount
    end

    def receiver_balance_update
      receiver_account.balance + amount
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

    def save_sender_if_possible(transference)
      if possible?
        transference.save
        AccountServices::AccountUpdateService.new(transference.final_balance, transference.sender).call
      end
    end

    def save_receiver_if_possible(transference)
      if possible?
        transference.save
        AccountServices::AccountUpdateService.new(transference.final_balance, transference.receiver ).call
      end
    end

  end

end
