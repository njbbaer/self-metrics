require 'test_helper'

class CardioReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cardio_report = cardio_reports(:one)
  end

  test "should get index" do
    get cardio_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_cardio_report_url
    assert_response :success
  end

  test "should create cardio_report" do
    assert_difference('CardioReport.count') do
      post cardio_reports_url, params: { cardio_report: { cardio_type: @cardio_report.cardio_type, machine: @cardio_report.machine, distance_miles: @cardio_report.distance_miles, duration_seconds: @cardio_report.duration_seconds, finished_at: @cardio_report.finished_at } }
    end

    assert_redirected_to cardio_report_url(CardioReport.last)
  end

  test "should show cardio_report" do
    get cardio_report_url(@cardio_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_cardio_report_url(@cardio_report)
    assert_response :success
  end

  test "should update cardio_report" do
    patch cardio_report_url(@cardio_report), params: { cardio_report: { cardio_type: @cardio_report.cardio_type, machine: @cardio_report.machine, distance_miles: @cardio_report.distance_miles, duration_seconds: @cardio_report.duration_seconds, finished_at: @cardio_report.finished_at } }
    assert_redirected_to cardio_report_url(@cardio_report)
  end

  test "should destroy cardio_report" do
    assert_difference('CardioReport.count', -1) do
      delete cardio_report_url(@cardio_report)
    end

    assert_redirected_to cardio_reports_url
  end
end
