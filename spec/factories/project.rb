# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { FFaker::Lorem.word }
    status { :active }
    user

    trait :archived do
      status { :archived }
    end

    factory :project_deactive, traits: [:deactive]
  end
end
