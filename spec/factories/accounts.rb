FactoryBot.define do

  factory :account do
    balance { 100 }
    user { nil }

    factory :sender_account do
      balance { 100 }
      user { nil }
    end
  
    factory :receiver_account do
      balance { 100 }
      user { nil }
    end
    
  end

end
