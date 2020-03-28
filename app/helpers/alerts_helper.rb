# frozen_string_literal: true

module AlertsHelper
  def alert_basic_html(level, text)
    "<div class='alert #{color_class(level)}'>#{text}</div>".html_safe
  end

  def alert_days_since_latest_html(level, days, modifier)
    "<div class='alert #{color_class(level)}'>
      &#9200; You last #{modifier} #{pluralized_days_content(days)} ago
    </div>".html_safe
  end

  def alert_weight_report_reminder
    days_since_latest = @weight_reports.days_since_latest
    return unless days_since_latest &.> 3

    level = days_since_latest >= 7 ? :warning : :danger
    alert_days_since_latest_html(level, days_since_latest, 'recorded your weight')
  end

  def alert_cardio_report_reminder
    days_since_latest = @cardio_reports.days_since_latest
    return unless days_since_latest &.> 3

    level = days_since_latest >= 7 ? :danger : :warning
    alert_days_since_latest_html(level, days_since_latest, 'did cardio exercise')
  end

  def alert_sleep_report_reminder
    days_since_latest = @sleep_reports.days_since_latest(offset: 6.hours)
    return unless days_since_latest &.>= 1

    level = days_since_latest >= 3 ? :danger : :warning
    alert_days_since_latest_html(level, days_since_latest, 'recorded your sleep')
  end

  def alert_sleep_restedness_low
    restedness = @sleep_reports.latest&.restedness_exp_avg
    return unless restedness &.<= 75

    level = restedness <= 65 ? :danger : :warning
    "<div class='alert #{color_class(level)}'>
      &#128164; Your sleep restedness score is <b>#{restedness.round}</b>%
    </div>".html_safe
  end

  def alert_asleep
    return unless @sleep_reports.latest&.complete? == false

    alert_basic_html('dark', 'You are currently asleep')
  end
end
