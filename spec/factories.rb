# frozen_string_literal: true

FactoryBot.define do
  factory :weight_report do
    date
    weight_pounds { 180.0 }
  end

  factory :cardio_report do
    date
    distance_miles { 3.0 }
    duration_seconds { 1800 }
    treadmill { true }
  end

  sequence :date do |n|
    Date.today - n.days
  end
end
