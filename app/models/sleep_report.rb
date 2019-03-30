class SleepReport < ApplicationRecord
  validates :asleep_at, presence: true
  validate :valid_duration?, if: :complete?

  def duration
    wakeup_at - asleep_at
  end

  def complete?
    wakeup_at.present?
  end

  private

  def valid_duration?
    if duration.negative?
      errors.add(:base, 'Sleep duration cannot be negative')
    elsif duration > 1.day
      errors.add(:base, 'Sleep duration cannot greater than a day')
    end
  end
end
