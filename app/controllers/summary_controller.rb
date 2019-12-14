# frozen_string_literal: true

class SummaryController < ApplicationController
  def index
    @sleep_reports = SleepReportsPresenter.all
  end
end
