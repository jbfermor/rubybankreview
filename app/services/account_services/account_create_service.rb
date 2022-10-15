module AccountServices
  class AccountCreateService 

    def initialize(balance, user)
      @balance = balance
      @user = user
    end
  
    def call
      create_account(@balance, @user)
    end
  
    private
  
    def create_account(balance, user)
      Account.create(balance: balance, user: user)
    end
  
    attr_reader :balance, :user
  
  end
end
