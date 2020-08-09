# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'root123' }
    status { :active }
    score

    trait :deative do
      status { :deactive }
    end

    factory :user_deactive, traits: [:deactive]
  end
end
