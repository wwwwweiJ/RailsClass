FactoryBot.define do 
    factory :user do 
        email{Faker::Internet.email}
        password{Faker::Internet.password}
        username{Faker::Internet.username}
        role{"user"}

        trait :vendor do 
            role{"vendor"}
        end

        trait :admin do 
            role{"admin"}
        end
    end
end