# frozen_string_literal: true

class WeightReportsController < ApplicationController
  before_action :set_weight_report, only: %i[show edit update destroy]

  # GET /weight_reports
  def index
    @weight_reports = WeightReport.all
    @weight_exp_avg_calculator = WeightExpAvgCalculator.new(@weight_reports, 0.1)
    gon.weight_reports_pounds = @weight_reports.ordered_by_recency.collect do |wr|
      [wr.epoch_timestamp, wr.weight_pounds]
    end
  end

  # GET /weight_reports/1
  def show; end

  # GET /weight_reports/new
  def new
    @weight_report = WeightReport.new(datestamp: Date.current)
  end

  # GET /weight_reports/1/edit
  def edit; end

  # POST /weight_reports
  def create
    @weight_report = WeightReport.new(weight_report_params)
    @weight_report.save!
    flash[:success] = 'Thank you for reporting your weight!'
    redirect_to weight_reports_path
  end

  # PATCH/PUT /weight_reports/1
  def update
    @weight_report.update!(weight_report_params)
    flash[:info] = 'Weight report updated'
    redirect_to weight_reports_path
  end

  # DELETE /weight_reports/1
  def destroy
    @weight_report.destroy
    flash[:danger] = 'Weight report deleted'
    redirect_to weight_reports_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weight_report
    @weight_report = WeightReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def weight_report_params
    params.require(:weight_report).permit(:datestamp, :weight_pounds)
  end
end
