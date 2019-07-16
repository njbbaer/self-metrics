# frozen_string_literal: true

class CardioReportsController < ApplicationController
  before_action :set_cardio_report, only: %i[show edit update destroy]

  # GET /cardio_reports
  def index
    @cardio_reports = CardioReport.all
    @sorted_by_calories = CardioReport.sorted_by_calories

    flash_cardio_report_reminder
  end

  # GET /cardio_reports/1
  def show; end

  # GET /cardio_reports/new
  def new
    @cardio_report = CardioReport.new
  end

  # GET /cardio_reports/1/edit
  def edit; end

  # POST /cardio_reports
  def create
    @cardio_report = CardioReport.new(cardio_report_params)

    respond_to do |format|
      if @cardio_report.save
        format.html { redirect_to cardio_reports_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cardio_reports/1
  def update
    respond_to do |format|
      if @cardio_report.update(cardio_report_params)
        format.html { redirect_to cardio_reports_path }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cardio_reports/1
  def destroy
    @cardio_report.destroy
    respond_to do |format|
      format.html { redirect_to cardio_reports_path }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cardio_report
    @cardio_report = CardioReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cardio_report_params
    params.require(:cardio_report).permit(
      :part_hours, :part_minutes, :part_seconds,
      :datestamp,
      :duration_seconds,
      :distance_miles,
      :treadmill
    )
  end
end
