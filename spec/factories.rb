# frozen_string_literal: true

FactoryBot.define do
  factory :weight_report do
    date { Date.today }
    weight_pounds { 180 }
  end
end
