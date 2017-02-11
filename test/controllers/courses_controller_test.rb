require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { audience: @course.audience, course_objective: @course.course_objective, duration: @course.duration, knowledge_based: @course.knowledge_based, learner_style_id: @course.learner_style_id, name: @course.name, no_of_objective: @course.no_of_objective, session: @course.session, skill_based: @course.skill_based, user_id: @course.user_id } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { audience: @course.audience, course_objective: @course.course_objective, duration: @course.duration, knowledge_based: @course.knowledge_based, learner_style_id: @course.learner_style_id, name: @course.name, no_of_objective: @course.no_of_objective, session: @course.session, skill_based: @course.skill_based, user_id: @course.user_id } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
