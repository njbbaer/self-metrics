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
      if @sleep_report.save!
        flash[:success] = 'Your sleep report was created'
        format.html { redirect_to sleep_reports_path }
      end
    end
  end

  # PATCH/PUT /sleep_reports/1
  def update
    respond_to do |format|
      if @sleep_report.update!(sleep_report_params)
        flash[:info] = 'Your sleep report was updated'
        format.html { redirect_to sleep_reports_path }
      end
    end
  end

  # DELETE /sleep_reports/1
  def destroy
    @sleep_report.destroy
    respond_to do |format|
      flash[:info] = 'Your sleep report was deleted'
      format.html { redirect_to sleep_reports_path }
    end
  end

  # POST /start
  def start
    SleepReport.create!(asleep_at: Time.now)
    flash[:success] = 'Good night!'
    redirect_to sleep_reports_path
  end

  # PATCH /stop
  def stop
    SleepReport.latest.update!(wakeup_at: Time.now)
    flash[:success] = 'Good morning!'
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
