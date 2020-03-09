# frozen_string_literal: true

module SleepReportsHelper
  def restedness_score_color_style(score)
    float = ([score, 60].max - 60) / 40
    red = float > 0.5 ? (1 - float) * 2 * 255 : 255
    green = float < 0.5 ? float * 2 * 255 : 255
    "rgb(#{red},#{green},0)"
  end

  def pluralized_days_content(days)
    plural = days > 1 ? 's' : ''
    "<b>#{days}</b> day#{plural}".html_safe
  end
end
