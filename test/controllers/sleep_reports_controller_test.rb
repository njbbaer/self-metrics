# frozen_string_literal: true

require 'test_helper'

class SleepReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
    @sleep_report = sleep_reports(:one)
  end

  test 'should get index' do
    get sleep_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_sleep_report_url
    assert_response :success
  end

  test 'should create sleep_report' do
    assert_difference('SleepReport.count') do
      post sleep_reports_url, params: {
        sleep_report: {
          asleep_at: @sleep_report.asleep_at,
          wakeup_at: @sleep_report.wakeup_at
        }
      }
    end

    assert_redirected_to sleep_report_url(SleepReport.last)
  end

  test 'should show sleep_report' do
    get sleep_report_url(@sleep_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_sleep_report_url(@sleep_report)
    assert_response :success
  end

  test 'should update sleep_report' do
    patch sleep_report_url(@sleep_report), params: {
      sleep_report: {
        asleep_at: @sleep_report.asleep_at,
        wakeup_at: @sleep_report.wakeup_at
      }
    }
    assert_redirected_to sleep_report_url(@sleep_report)
  end

  test 'should destroy sleep_report' do
    assert_difference('SleepReport.count', -1) do
      delete sleep_report_url(@sleep_report)
    end

    assert_redirected_to sleep_reports_url
  end
end
