# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sleep_reports = SleepReportsPresenter.all
    @weight_reports = WeightReportsPresenter.all
    @cardio_reports = CardioReportsPresenter.all
  end
end
