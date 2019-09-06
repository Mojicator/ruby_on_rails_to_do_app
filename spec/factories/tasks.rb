# frozen_string_literal: true

FactoryBot.define do
  factory :good_task, class: Task do
    title       { Faker::Verb.base + ' something' }
    definition  { Faker::Lorem.sentence }
    added_date  { Faker::Date.backward(days: 8) }
    end_date    { Faker::Date.forward(days: 3) }
    association :list, factory: :good_list, strategy: :create
  end
end
