# frozen_string_literal: true

module SleepReportsHelper
  def sleep_duration_color_style(duration)
    hours = duration.hours
    float =
      if hours > 9 then 1
      elsif hours < 6 then 0
      else (hours - 6) / 3.0
      end
    normalized_color_style(float)
  end

  def restedness_score_color_style(score)
    float = ([score, 60].max - 60) / 40
    normalized_color_style(float)
  end

  def normalized_color_style(float)
    red = float > 0.5 ? (1 - float) * 2 * 255 : 255
    green = float < 0.5 ? float * 2 * 255 : 255
    "rgb(#{red},#{green},0)"
  end

  def pluralized_days_content(days)
    plural = days > 1 ? 's' : ''
    "<b>#{days}</b> day#{plural}".html_safe
  end
end
