# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name 'Tom Example'
    sequence(:email) { |n|"tom#{n}@example.com"}
    password_digest User.digest('password')
    admin true
  end
end
