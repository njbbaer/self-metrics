class SleepReport < ApplicationRecord
  validates_presence_of :asleep_at
  validate :valid_duration, if: :complete?
  validate :valid_dates

  def duration
    wakeup_at - asleep_at
  end

  def complete?
    wakeup_at.present?
  end

  private

  def valid_duration
    if duration.negative?
      errors.add(:base, 'Sleep duration cannot be negative')
    elsif duration > 1.day
      errors.add(:base, 'Sleep duration cannot greater than a day')
    end
  end

  def valid_dates
    errors.add(:asleep_at, 'cannot be in the future') if asleep_at.future?
    errors.add(:wakeup_at, 'cannot be in the future') if wakeup_at&.future?
  end
end
