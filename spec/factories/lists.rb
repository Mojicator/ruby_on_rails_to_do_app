# frozen_string_literal: true

FactoryBot.define do
  factory :good_list, class: List do
    title         { Faker::Book.title }
    description   { Faker::Lorem.paragraph(sentence_count: 1) }
    created_date  { Faker::Date.backward(days: 8) }
    end_date      { Faker::Date.forward(days: 3) }
    association :user, factory: :good_user, strategy: :build
  end
end
