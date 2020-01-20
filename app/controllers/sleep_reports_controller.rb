# frozen_string_literal: true

class SleepReportsController < ApplicationController
  before_action :set_sleep_report, only: %i[show edit update destroy]

  # GET /sleep_reports
  def index
    @sleep_reports = SleepReportsCollection.new
    @sleep_reports.calculate_days_since_previous!
    @sleep_reports.calculate_exp_avg!(alpha: 0.5)
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
    @sleep_report.save!
    flash[:success] = 'Sleep report created'
    redirect_to sleep_reports_path
  end

  # PATCH/PUT /sleep_reports/1
  def update
    @sleep_report.update!(sleep_report_params)
    flash[:info] = 'Sleep report updated'
    redirect_to sleep_reports_path
  end

  # DELETE /sleep_reports/1
  def destroy
    @sleep_report.destroy
    flash[:danger] = 'Sleep report deleted'
    redirect_to sleep_reports_path
  end

  # POST /start
  def start
    sleep_report = SleepReport.create!(asleep_at: Time.now)
    time_string = sleep_report.asleep_at.strftime('%-I:%M %p')
    flash[:success] = "Goodnight! It's #{time_string}"
    redirect_to sleep_reports_path
  end

  # PATCH /stop
  def stop
    sleep_report = SleepReportsPresenter.all.latest
    sleep_report.update!(wakeup_at: Time.now)
    duration_string = sleep_report.duration.strftime('%-Hh %-Mm')
    flash[:success] = "Goodmorning! You slept for #{duration_string}"
    redirect_to sleep_reports_path
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
