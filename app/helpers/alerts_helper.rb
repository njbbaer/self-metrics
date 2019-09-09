# frozen_string_literal: true

module AlertsHelper
  def alert_basic_html(level, text)
    "<div class='alert #{color_class(level)}'>#{text}</div>".html_safe
  end

  def alert_days_since_latest_html(level, modifier, days)
    "<div class='alert #{color_class(level)}'>
      Last reported #{modifier} <b>#{days}</b> days ago
    </div>".html_safe
  end

  def alert_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_days_since_latest_html(level, 'weight', days_since_latest)
  end

  def alert_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_days_since_latest_html(level, 'running', days_since_latest)
  end

  def alert_sleep_report_reminder
    days_since_latest = SleepReport.days_since_latest
    return if days_since_latest < 1

    level = days_since_latest < 3 ? :warning : :danger
    alert_days_since_latest_html(level, 'sleep', days_since_latest)
  end
end
