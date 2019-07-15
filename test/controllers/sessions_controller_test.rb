# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_session_path
    assert_response :success
  end

  test 'should get create' do
    skip
    get sessions_create_path
    assert_response :success
  end

  test 'should get destroy' do
    skip
    get sessions_destroy_path
    assert_response :success
  end
end
