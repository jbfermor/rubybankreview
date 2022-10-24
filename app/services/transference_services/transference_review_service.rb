module TransferenceServices
  
  class TransferenceReviewService 

    attr_reader :amount, :sender, :receiver

    def initialize(amount, receiver, sender)
      @amount = amount
      @receiver = receiver
      @sender = sender
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