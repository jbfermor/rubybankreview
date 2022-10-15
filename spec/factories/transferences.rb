FactoryBot.define do
  factory :transference do
    amount { 1 }
    sender { 1 }
    receiver { 1 }
    account { nil }
  end
end
