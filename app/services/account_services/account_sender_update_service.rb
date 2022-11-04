module AccountServices
  class AccountSenderUpdateService 

    def initialize(amount, sender_id)
      @amount = amount
      @sender_id = sender_id
    end
  
    def call
      update_account(amount, @sender_id)
    end
  
    private
  
    def update_account(amount, sender_id)
      account = Account.find(sender_id)
      account.update(balance: account.balance - amount)
    end
  
    attr_reader :amount, :sender_id
  
  end
end
