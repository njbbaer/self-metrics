# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    end
  end

  def current_average_weight
    weight_avg = WeightReport.current_average_weight(days=130)
    return 'n/a' if weight_avg.nil?

    format('%.1f', weight_avg)
  end

  def authenticated?
    cookies.encrypted[:password] == Rails.configuration.password
  end
end
