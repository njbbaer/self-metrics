# frozen_string_literal: true

class SleepReportsController < ApplicationController
  before_action :set_sleep_report, only: %i[show edit update destroy]

  # GET /sleep_reports
  def index
    @sleep_reports = SleepReport.all
  end

  # GET /sleep_reports/1
  def show; end

  # GET /sleep_reports/new
  def new
    @sleep_report = SleepReport.new
  end

  # GET /sleep_reports/1/edit
  def edit; end

  # POST /sleep_reports
  def create
    @sleep_report = SleepReport.new(sleep_report_params)

    respond_to do |format|
      if @sleep_report.save
        format.html { redirect_to sleep_reports_url }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sleep_reports/1
  def update
    respond_to do |format|
      if @sleep_report.update(sleep_report_params)
        format.html { redirect_to sleep_reports_url }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sleep_reports/1
  def destroy
    @sleep_report.destroy
    respond_to do |format|
      format.html { redirect_to sleep_reports_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sleep_report
    @sleep_report = SleepReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sleep_report_params
    params.require(:sleep_report).permit(:asleep_at, :wakeup_at)
  end
end
