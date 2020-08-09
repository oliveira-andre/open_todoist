# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    points { rand(0..100) }
    rank { :iron }
  end
end
