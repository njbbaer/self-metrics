# frozen_string_literal: true

class WeightReportsController < ApplicationController
  before_action :set_weight_report, only: %i[show edit update destroy]

  # GET /weight_reports
  # GET /weight_reports.json
  def index
    @weight_reports = WeightReport.all
  end

  # GET /weight_reports/1
  # GET /weight_reports/1.json
  def show; end

  # GET /weight_reports/new
  def new
    @weight_report = WeightReport.new
  end

  # GET /weight_reports/1/edit
  def edit; end

  # POST /weight_reports
  # POST /weight_reports.json
  def create
    @weight_report = WeightReport.new(weight_report_params)

    respond_to do |format|
      if @weight_report.save
        format.html { redirect_to @weight_report, notice: 'Weight report was successfully created.' }
        format.json { render :show, status: :created, location: @weight_report }
      else
        format.html { render :new }
        format.json { render json: @weight_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_reports/1
  # PATCH/PUT /weight_reports/1.json
  def update
    respond_to do |format|
      if @weight_report.update(weight_report_params)
        format.html { redirect_to @weight_report, notice: 'Weight report was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight_report }
      else
        format.html { render :edit }
        format.json { render json: @weight_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_reports/1
  # DELETE /weight_reports/1.json
  def destroy
    @weight_report.destroy
    respond_to do |format|
      format.html { redirect_to weight_reports_url, notice: 'Weight report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weight_report
    @weight_report = WeightReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def weight_report_params
    params.require(:weight_report).permit(:timestamp, :weight_pounds)
  end
end
