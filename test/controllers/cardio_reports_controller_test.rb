# frozen_string_literal: true

require 'test_helper'

class CardioReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
    @cardio_report = cardio_reports(:one)
  end

  test 'should get index' do
    get cardio_reports_path
    assert_response :success
  end

  test 'should get new' do
    get new_cardio_report_path
    assert_response :success
  end

  test 'should create cardio_report' do
    assert_difference('CardioReport.count') do
      post cardio_reports_path, params: {
        cardio_report: {
          treadmill: @cardio_report.treadmill,
          distance_miles: @cardio_report.distance_miles,
          duration_seconds: @cardio_report.duration_seconds,
          datestamp: @cardio_report.datestamp
        }
      }
    end

    assert_redirected_to cardio_reports_path
  end

  test 'should show cardio_report' do
    get cardio_report_path(@cardio_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cardio_report_path(@cardio_report)
    assert_response :success
  end

  test 'should update cardio_report' do
    patch cardio_report_path(@cardio_report), params: {
      cardio_report: {
        treadmill: @cardio_report.treadmill,
        distance_miles: @cardio_report.distance_miles,
        duration_seconds: @cardio_report.duration_seconds,
        datestamp: @cardio_report.datestamp
      }
    }
    assert_response :success
  end

  test 'should destroy cardio_report' do
    assert_difference('CardioReport.count', -1) do
      delete cardio_report_path(@cardio_report)
    end

    assert_redirected_to cardio_reports_path
  end
end
