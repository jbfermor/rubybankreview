module UserServices

  class UserCreateService

    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      user = create_user(@email, @password)
      create_user_account(user.id)
    end
  
    private
  
    attr_reader :email, :password
  
    def create_user(email, password)
      User.create!(email: email, password: password)
    end

    def create_user_account(balance = 0, user_id)
      found_user = User.find(user_id)
      AccountServices::AccountCreateService.new(balance, found_user).call
    end

  end

end