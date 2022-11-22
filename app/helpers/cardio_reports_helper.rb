# frozen_string_literal: true

module CardioReportsHelper
  def strftime_duration(duration)
    strf_string = duration.hours >= 1 ? '%k:%M:%S' : '%M:%S'
    duration.strftime(strf_string)
  end
end
