FactoryBot.define do
  factory :transference do
    amount { 10 }
    sender { 1 }
    receiver { 2 }
    final_balance { 90 }
    account { nil }

    factory :transference_without_sender do
      amount { 10 }
      receiver { 2 }
      final_balance { 90 }
      account { nil }
    end
    
  end

end
