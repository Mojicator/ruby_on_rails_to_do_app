# frozen_string_literal: true

FactoryBot.define do
  factory :good_user, class: User do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    description { Faker::Quote.yoda }
    email       { Faker::Internet.safe_email }
    password    { Faker::Internet.password }
  end
end
