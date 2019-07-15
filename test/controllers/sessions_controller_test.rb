# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page' do
    get login_path
    assert_response :success
  end

  test 'should successfully login with correct password' do
    post login_path, params: { password: Rails.configuration.password }
    assert_redirected_to root_path
  end

  test 'should fail to login with incorrect password' do
    post login_path, params: { password: 'incorrect_password' }
    assert_redirected_to login_path
  end

  test 'should logout' do
    authenticate
    delete logout_path
    assert_redirected_to login_path
  end
end
