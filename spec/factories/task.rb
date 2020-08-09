# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.phrase }
    status { 0 }
    project
  end
end
