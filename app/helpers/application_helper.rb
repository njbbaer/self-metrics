# frozen_string_literal: true

module ApplicationHelper
  def alert_class(level)
    case level
    when :notice  then 'alert alert-info'
    when :success then 'alert alert-success'
    when :danger  then 'alert alert-danger'
    when :warning then 'alert alert-warning'
    end
  end

  def current_average_weight(days)
    weight_avg = WeightReport.current_average_weight(days)
    return 'n/a' if weight_avg.nil?

    format('%.1f', weight_avg)
  end

  def authenticated?
    cookies.encrypted[:password] == Rails.configuration.password
  end

  def alert_basic(level, text)
    "<div class='alert #{alert_class(level)}'>#{text}</div>".html_safe
  end

  def alert_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_basic(level, "Your last recorded your weight #{days_since_latest} days ago")
  end

  def alert_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_basic(level, "You last went running #{days_since_latest} days ago")
  end
end
