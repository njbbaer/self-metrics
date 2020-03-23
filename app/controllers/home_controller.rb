# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @weight_reports = WeightReportsCollection.new
    @cardio_reports = CardioReportsCollection.new
    @sleep_reports = SleepReportsCollection.new.tap do |report|
      report.calculate_restedness_exp_avg!(alpha: 0.5)
    end
  end
end
