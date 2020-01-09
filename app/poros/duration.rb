# frozen_string_literal: true

class Duration
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def hours
    @seconds / 3600.0
  end

  def part_minutes
    (@seconds / 60.0).floor
  end

  def part_seconds
    (@seconds % 60.0).floor
  end

  def strftime(code)
    Time.at(@seconds).utc.strftime(code)
  end
end
