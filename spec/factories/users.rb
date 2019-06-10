# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name 'Tom Example'
    email 'tom@example.com'
    password_digest User.digest('password')
    admin true
  end
end
