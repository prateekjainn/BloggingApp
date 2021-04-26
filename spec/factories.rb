FactoryBot.define do

    factory :user do
      username {Faker::Name.unique.name }
      email {Faker::Internet.email}
      password {Faker::Internet.password}
      role_id {1}
    end

    factory :article do
      title {Faker::String.random(length: 3..50) }
      description {Faker::String.random(length: 1..300) }
      user
    end

    factory :comment do
      body {Faker::String.random}
      article
    end
  end