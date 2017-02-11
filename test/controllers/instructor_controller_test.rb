require 'test_helper'

class InstructorControllerTest < ActionDispatch::IntegrationTest
  test "should get learners" do
    get instructor_learners_url
    assert_response :success
  end

  test "should get create_course" do
    get instructor_create_course_url
    assert_response :success
  end

  test "should get new_course" do
    get instructor_new_course_url
    assert_response :success
  end

  test "should get list_course" do
    get instructor_list_course_url
    assert_response :success
  end

  test "should get update_course" do
    get instructor_update_course_url
    assert_response :success
  end

end
