# frozen_string_literal: true

module AlertsHelper
  def alert_basic_html(level, text)
    "<div class='alert #{color_class(level)}'>#{text}</div>".html_safe
  end

  def alert_days_since_latest_html(level, days, modifier)
    "<div class='alert #{color_class(level)}'>
      You last #{modifier} <b>#{days}</b> days ago
    </div>".html_safe
  end

  def alert_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_days_since_latest_html(level, days_since_latest, 'recorded your weight')
  end

  def alert_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_days_since_latest_html(level, days_since_latest, 'went running')
  end

  def alert_sleep_report_reminder
    days_since_latest = SleepReport.days_since_latest
    return if days_since_latest < 1

    level = days_since_latest < 3 ? :warning : :danger
    alert_days_since_latest_html(level, days_since_latest, 'recorded your sleep')
  end

  def alert_cardio_report_calories
    calories = CardioReport.sum_calories(end_date: Date.today - 7.days).to_i
    return if calories < 1000

    "<div class='alert alert-success'>
      In the last <b>7</b> days you burned <b>#{calories}</b> calories
    </div>".html_safe
  end
end
