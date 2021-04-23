FactoryBot.define do
  
    factory :user do
      username {Faker::Name.unique.name }
      email {Faker::Internet.email}
      password {Faker::Internet.password}
    end

    factory :article do
      title {Faker::String.random(length: 3..50) }
      description {Faker::String.random(length: 1..300) }
      user_id { '97' }
    end
  end