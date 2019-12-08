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

  def authenticated?
    cookies.encrypted[:password] == Rails.configuration.password
  end

  def dev_banner_text_html
    "<p><i>#{Rails.env.capitalize} environment</i></p>".html_safe
  end

  def production?
    Rails.env == 'production'
  end
end
