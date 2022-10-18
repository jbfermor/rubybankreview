module TransferenceServices
  
  class TransferenceSharedService 

    attr_reader :amount, :sender, :receiver

    def initialize(amount, sender = nil, receiver)
      @amount = amount
      @receiver = receiver
      @sender = sender
    end
    
    def receiver_account(receiver)
      Account.find_by(user_id: receiver).id
    end
  
  end
  
end