# frozen_string_literal: true

class SleepReportsController < ApplicationController
  before_action :set_sleep_report, only: %i[show edit update destroy]

  # GET /sleep_reports
  # GET /sleep_reports.json
  def index
    @sleep_reports = SleepReport.all
  end

  # GET /sleep_reports/1
  # GET /sleep_reports/1.json
  def show; end

  # GET /sleep_reports/new
  def new
    @sleep_report = SleepReport.new
  end

  # GET /sleep_reports/1/edit
  def edit; end

  # POST /sleep_reports
  # POST /sleep_reports.json
  def create
    @sleep_report = SleepReport.new(sleep_report_params)

    respond_to do |format|
      if @sleep_report.save
        format.html { redirect_to @sleep_report, notice: 'Sleep report was successfully created.' }
        format.json { render :show, status: :created, location: @sleep_report }
      else
        format.html { render :new }
        format.json { render json: @sleep_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleep_reports/1
  # PATCH/PUT /sleep_reports/1.json
  def update
    respond_to do |format|
      if @sleep_report.update(sleep_report_params)
        format.html { redirect_to @sleep_report, notice: 'Sleep report was successfully updated.' }
        format.json { render :show, status: :ok, location: @sleep_report }
      else
        format.html { render :edit }
        format.json { render json: @sleep_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleep_reports/1
  # DELETE /sleep_reports/1.json
  def destroy
    @sleep_report.destroy
    respond_to do |format|
      format.html { redirect_to sleep_reports_url, notice: 'Sleep report was successfully destroyed.' }
      format.json { head :no_content }
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
