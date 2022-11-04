module AccountServices
  class AccountReceiverUpdateService 

    def initialize(amount, receiver_id)
      @amount = amount
      @receiver_id = receiver_id
    end
  
    def call
      update_account(amount, @receiver_id)
    end
  
    private
  
    def update_account(amount, receiver_id)
      account = Account.find(receiver_id)
      account.update(balance: account.balance + amount)
    end
  
    attr_reader :amount, :receiver_id
  
  end
end
