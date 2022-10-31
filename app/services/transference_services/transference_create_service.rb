module TransferenceServices

  class TransferenceCreateService

    attr_reader :amount, :sender, :receiver

    def initialize(amount, receiver, sender)
      @amount = amount
      @receiver = receiver
      @sender = sender
    end
  
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

    def sender_account
      User.find(@sender).account
    end
    
    def receiver_account
      User.find(@receiver).account
    end

    def sender_balance
      sender_account.balance - @amount
    end

    def receiver_balance
      receiver_account.balance + @amount
    end

    def possible?
      different_users? && balance_enough?
    end
  
    def different_users?
      @sender != @receiver
    end
  
    def balance_enough?
      sender_account.balance - @amount >= 0
    end

  end
  
end
