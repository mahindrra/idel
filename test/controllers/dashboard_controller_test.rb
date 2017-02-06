require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_home" do
    get dashboard_admin_home_url
    assert_response :success
  end

  test "should get teacher_home" do
    get dashboard_teacher_home_url
    assert_response :success
  end

  test "should get student_home" do
    get dashboard_student_home_url
    assert_response :success
  end

end
