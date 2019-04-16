require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    skip
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    skip
    get sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    skip
    get sessions_destroy_url
    assert_response :success
  end
end
