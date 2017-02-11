require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get courses" do
    get admin_courses_url
    assert_response :success
  end

end
