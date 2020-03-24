# frozen_string_literal: true

FactoryBot.define do
  factory :weight_report do
    sequence(:date) { |n| Date.today - n.days }
    weight_pounds { 180.0 }
  end

  factory :cardio_report do
    sequence(:date) { |n| Date.today - n.days }
    distance_miles { 3.0 }
    duration_seconds { 1800 }
    activity_type { 'treadmill' }
  end

  factory :sleep_report do
    transient do
      sequence(:date) { |n| Date.today - n.days }
    end

    asleep_at { date - 1.hours }
    wakeup_at { date + 7.hours }
  end
end
