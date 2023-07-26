# frozen_string_literal: true

# == Schema Information
#
# Table name: sleep_reports
#
#  id         :integer          not null, primary key
#  asleep_at  :datetime
#  wakeup_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SleepReport < ApplicationRecord
  attr_accessor :restedness_exp_avg,
                :restedness_exp_avg_accuracy,
                :days_since_previous

  validates_presence_of :asleep_at
  validate :valid_duration, if: :complete?
  validate :valid_dates

  before_save :round_to_minute!

  scope :ordered_by_recency, -> { order(wakeup_at: :asc) }
  scope :completed, -> { where.not(wakeup_at: nil) }

  def duration
    Duration.new(wakeup_at - asleep_at)
  end

  def date
    asleep_at.to_date + (asleep_at.hour > 12 ? 1.day : 0)
  end

  def complete?
    wakeup_at.present?
  end

  def restedness_score
    (duration.seconds.clamp(0, 9.hours.to_i) - 3.hours.to_i) / 6.hours.to_i * 100
  end

  private

  def valid_duration
    if duration.seconds.negative?
      errors.add(:wakeup_at, 'sleep duration cannot be negative')
    elsif duration.seconds > 1.day
      errors.add(:wakeup_at, 'sleep duration cannot be greater than a day')
    end
  end

  def valid_dates
    errors.add(:asleep_at, 'cannot be in the future') if asleep_at&.future?
    errors.add(:wakeup_at, 'cannot be in the future') if wakeup_at&.future?
  end

  def round_to_minute!
    self.asleep_at = asleep_at.beginning_of_minute if asleep_at
    self.wakeup_at = wakeup_at.beginning_of_minute if wakeup_at
  end
end
