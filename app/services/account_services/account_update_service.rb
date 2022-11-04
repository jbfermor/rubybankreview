module AccountServices
  class AccountUpdateService 

    def initialize(amount, user_id)
      @amount = amount
      @user_id = user_id
    end
  
    def call
      update_account(@amount, @user_id)
    end
  
    private

    attr_reader :amount, :user_id

    def update_account(amount, user_id)
      account = User.find(user_id).account
      account.update(balance: amount)
    end
  
  end
end
