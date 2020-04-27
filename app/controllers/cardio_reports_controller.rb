# frozen_string_literal: true

class CardioReportsController < ApplicationController
  before_action :set_cardio_report, only: %i[show edit update destroy]

  # GET /cardio_reports
  def index
    @cardio_reports = CardioReportsCollection.new.tap do |collection|
      collection.calculate_days_since_previous!
      collection.calculate_run_ranking_by_calories!
      collection.calculate_run_ranking_by_speed_for_distance!
    end
  end

  # GET /cardio_reports/1
  def show; end

  # GET /cardio_reports/new
  def new
    @cardio_report = CardioReport.new(date: pseudo_current_date)
  end

  # GET /cardio_reports/1/edit
  def edit; end

  # POST /cardio_reports
  def create
    @cardio_report = CardioReport.new(cardio_report_params)
    @cardio_report.save!
    flash[:success] = 'Great job going for a run!'
    redirect_to cardio_reports_path
  end

  # PATCH/PUT /cardio_reports/1
  def update
    @cardio_report.update!(cardio_report_params)
    flash[:info] = 'Cardio report updated'
    redirect_to cardio_reports_path
  end

  # DELETE /cardio_reports/1
  def destroy
    @cardio_report.destroy
    flash[:danger] = 'Cardio report deleted'
    redirect_to cardio_reports_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cardio_report
    @cardio_report = CardioReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cardio_report_params
    params.require(:cardio_report).permit(
      :part_minutes, :part_seconds,
      :date,
      :duration_seconds,
      :elevation_gain_feet,
      :distance_miles,
      :activity_type,
      :location
    )
  end
end
