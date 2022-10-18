FactoryBot.define do

  factory :user do

    email { "john@doe.com" }
    password { "password" }

    factory :sender do
      email { "john@doe.com" }
      password { "password" }
    end
  
    factory :receiver do
      email { "jane@doe.com" }
      password { "password" }
    end

  end
  
end
