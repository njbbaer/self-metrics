class SleepReport < ApplicationRecord
  validates_presence_of :asleep_at
  validate :valid_duaration_seconds, if: :complete?
  validate :valid_dates

  def duaration_seconds
    wakeup_at - asleep_at
  end

  def complete?
    wakeup_at.present?
  end

  private

  def valid_duaration_seconds
    if duaration_seconds.negative?
      errors.add(:base, 'Sleep duaration_seconds cannot be negative')
    elsif duaration_seconds > 1.day
      errors.add(:base, 'Sleep duaration_seconds cannot greater than a day')
    end
  end

  def valid_dates
    errors.add(:asleep_at, 'cannot be in the future') if asleep_at.future?
    errors.add(:wakeup_at, 'cannot be in the future') if wakeup_at&.future?
  end
end
