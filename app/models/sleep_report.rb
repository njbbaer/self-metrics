# frozen_string_literal: true

# == Schema Information
#
# Table name: sleep_reports
#
#  id         :bigint(8)        not null, primary key
#  asleep_at  :datetime
#  wakeup_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SleepReport < ApplicationRecord
  validates_presence_of :asleep_at
  validate :valid_duration, if: :complete?
  validate :valid_dates

  before_save :round_to_minute!

  scope :ordered_by_recency, -> { order(wakeup_at: :asc) }

  class << self
    def latest
      ordered_by_recency.last
    end

    def days_since_latest
      ((Time.now - 6.hours).to_date - latest.date).to_i
    end
  end

  def duration_seconds
    wakeup_at - asleep_at
  end

  def date
    asleep_at.to_date + (asleep_at.hour > 12 ? 1.day : 0)
  end

  def score
    duration_component = 2 / 3.0 * normalize(duration_seconds, 9.hours)
    asleep_component   = 1 / 6.0 * normalize(asleep_at - ideal_asleep_at, 9.hours, true)
    wakeup_component   = 1 / 6.0 * normalize(wakeup_at - ideal_wakeup_at, 9.hours, true)
    (duration_component + asleep_component + wakeup_component) * 100
  end

  def score_grade
    grades = %w[F F F F F F F F F F F F F F F F F F D- D D+ C- C C+ B- B B+ A- A A+ A+]
    grades[(3.0 * score.round / 10).floor]
  end

  def complete?
    wakeup_at.present?
  end

  def ideal_asleep_at
    (wakeup_at - 1.day).change(hour: 22, min: 0, sec: 0)
  end

  def ideal_wakeup_at
    wakeup_at.change(hour: 7, min: 0, sec: 0)
  end

  def strf_duration(code)
    Time.at(duration_seconds).utc.strftime(code)
  end

  private

  def valid_duration
    if duration_seconds.negative?
      errors.add(:wakeup_at, 'sleep duration cannot be negative')
    elsif duration_seconds > 1.day
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

def normalize(val, max, invert = false)
  result = [val.abs, max].min / max
  invert ? 1 - result : result
end
