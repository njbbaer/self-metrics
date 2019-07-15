# frozen_string_literal: true

require 'test_helper'

class WeightReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
    @weight_report = weight_reports(:one)
  end

  test 'should get index' do
    get weight_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_weight_report_url
    assert_response :success
  end

  test 'should create weight_report' do
    assert_difference('WeightReport.count') do
      post weight_reports_url, params: {
        weight_report: {
          weight_pounds: @weight_report.weight_pounds,
          datestamp: @weight_report.datestamp
        }
      }
    end

    assert_redirected_to weight_reports_url
  end

  test 'should show weight_report' do
    get weight_report_url(@weight_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_weight_report_url(@weight_report)
    assert_response :success
  end

  test 'should update weight_report' do
    patch weight_report_url(@weight_report), params: {
      weight_report: {
        weight_pounds: @weight_report.weight_pounds,
        datestamp: @weight_report.datestamp
      }
    }
    assert_redirected_to weight_reports_url
  end

  test 'should destroy weight_report' do
    assert_difference('WeightReport.count', -1) do
      delete weight_report_url(@weight_report)
    end

    assert_redirected_to weight_reports_url
  end
end
