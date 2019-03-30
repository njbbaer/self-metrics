class SleepReport < ApplicationRecord
  validates :asleep_at, presence: true
  validate :valid_duration?, if: :complete?

  def length
    wakeup_at - asleep_at
  end

  def complete?
    wakeup_at.present?
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
