# frozen_string_literal: true

module SleepReportsHelper
  def sleep_color_class(sleep_report)
    return 'alert-dark' unless sleep_report.complete?

    case sleep_report.score.round
    when 90..100 then 'alert-success'
    when 70..79  then 'alert-warning'
    when 0..69   then 'alert-danger'
    end
  end
end
