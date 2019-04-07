# frozen_string_literal: true

class SleepReport < ApplicationRecord
  validates_presence_of :asleep_at
  validate :valid_duration_seconds, if: :complete?
  validate :valid_dates

  scope :ordered_by_recency, -> { order(awake_at: :asc) }

  def duration_seconds
    wakeup_at - asleep_at
  end

  def complete?
    wakeup_at.present?
  end

  private

  def valid_duration_seconds
    if duration_seconds.negative?
      errors.add(:base, 'Sleep duration_seconds cannot be negative')
    elsif duration_seconds > 1.day
      errors.add(:base, 'Sleep duration_seconds cannot greater than a day')
    end
  end

  def valid_dates
    errors.add(:asleep_at, 'cannot be in the future') if asleep_at.future?
    errors.add(:wakeup_at, 'cannot be in the future') if wakeup_at&.future?
  end
end
