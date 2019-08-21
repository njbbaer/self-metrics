# frozen_string_literal: true

module ApplicationHelper
  def color_class(level, bg = false)
    case level.to_sym
    when :info      then bg ? 'bg-info'      : 'alert-info'
    when :success   then bg ? 'bg-success'   : 'alert-success'
    when :warning   then bg ? 'bg-warning'   : 'alert-warning'
    when :danger    then bg ? 'bg-danger'    : 'alert-danger'
    when :secondary then bg ? 'bg-secondary' : 'alert-secondary'
    when :dark      then bg ? 'bg-dark'      : 'alert-dark'
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
    "<div class='alert #{color_class(level)}'>#{text}</div>".html_safe
  end

  def alert_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_basic(level, "You last reported your weight #{days_since_latest} days ago")
  end

  def alert_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    level = days_since_latest < 7 ? :warning : :danger
    alert_basic(level, "You last went running #{days_since_latest} days ago")
  end

  def days_since_previous(report)
    previous_idx = @ordered_by_recency.pluck(:id).index(report.id) - 1
    return nil if previous_idx.negative?

    (report.date - @ordered_by_recency[previous_idx].date).to_i
  end

  def nonprod_text
    return if Rails.env == 'production'

    " ― #{Rails.env.capitalize}"
  end
end
