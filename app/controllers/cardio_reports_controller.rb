class CardioReportsController < ApplicationController
  before_action :set_cardio_report, only: [:show, :edit, :update, :destroy]

  # GET /cardio_reports
  # GET /cardio_reports.json
  def index
    @cardio_reports = CardioReport.all
  end

  # GET /cardio_reports/1
  # GET /cardio_reports/1.json
  def show
  end

  # GET /cardio_reports/new
  def new
    @cardio_report = CardioReport.new
  end

  # GET /cardio_reports/1/edit
  def edit
  end

  # POST /cardio_reports
  # POST /cardio_reports.json
  def create
    @cardio_report = CardioReport.new(cardio_report_params)

    respond_to do |format|
      if @cardio_report.save
        format.html { redirect_to @cardio_report, notice: 'Cardio report was successfully created.' }
        format.json { render :show, status: :created, location: @cardio_report }
      else
        format.html { render :new }
        format.json { render json: @cardio_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cardio_reports/1
  # PATCH/PUT /cardio_reports/1.json
  def update
    respond_to do |format|
      if @cardio_report.update(cardio_report_params)
        format.html { redirect_to @cardio_report, notice: 'Cardio report was successfully updated.' }
        format.json { render :show, status: :ok, location: @cardio_report }
      else
        format.html { render :edit }
        format.json { render json: @cardio_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cardio_reports/1
  # DELETE /cardio_reports/1.json
  def destroy
    @cardio_report.destroy
    respond_to do |format|
      format.html { redirect_to cardio_reports_url, notice: 'Cardio report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cardio_report
      @cardio_report = CardioReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cardio_report_params
      params.require(:cardio_report).permit(:finished_at, :duration, :miles, :cardio_type, :machine)
    end
end
