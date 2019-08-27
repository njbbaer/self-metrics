# frozen_string_literal: true

def alert_basic_html(level, text)
  "<div class='alert #{color_class(level)}'>#{text}</div>".html_safe
end

def alert_weight_report_reminder
  days_since_latest = WeightReport.days_since_latest
  return if days_since_latest < 3

  level = days_since_latest < 7 ? :warning : :danger
  alert_basic_html(level, "You last reported your weight #{days_since_latest} days ago")
end

def alert_cardio_report_reminder
  days_since_latest = CardioReport.days_since_latest
  return if days_since_latest < 3

  level = days_since_latest < 7 ? :warning : :danger
  alert_basic_html(level, "You last went running #{days_since_latest} days ago")
end