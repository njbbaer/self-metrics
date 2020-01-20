# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sleep_reports = SleepReportsPresenter.all
    @weight_reports = WeightReportsCollection.new
    @cardio_reports = CardioReportsPresenter.all
  end
end
