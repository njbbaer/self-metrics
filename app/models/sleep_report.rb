class SleepReport < ApplicationRecord
  validate :valid_duration?

  def length
    wakeup_at - asleep_at
  end

  private

  def valid_duration?
    if length.negative?
      errors.add(:base, 'Sleep duration cannot be negative')
    elsif length > 1.day
      errors.add(:base, 'Sleep duration cannot greater than a day')
    end
  end
end
