# frozen_string_literal: true

class SummaryController < ApplicationController
  def index
    flash_weight_report_reminder
    flash_cardio_report_reminder
  end
end
