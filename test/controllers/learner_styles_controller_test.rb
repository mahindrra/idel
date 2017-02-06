require 'test_helper'

class LearnerStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learner_style = learner_styles(:one)
  end

  test "should get index" do
    get learner_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_learner_style_url
    assert_response :success
  end

  test "should create learner_style" do
    assert_difference('LearnerStyle.count') do
      post learner_styles_url, params: { learner_style: { name: @learner_style.name } }
    end

    assert_redirected_to learner_style_url(LearnerStyle.last)
  end

  test "should show learner_style" do
    get learner_style_url(@learner_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_learner_style_url(@learner_style)
    assert_response :success
  end

  test "should update learner_style" do
    patch learner_style_url(@learner_style), params: { learner_style: { name: @learner_style.name } }
    assert_redirected_to learner_style_url(@learner_style)
  end

  test "should destroy learner_style" do
    assert_difference('LearnerStyle.count', -1) do
      delete learner_style_url(@learner_style)
    end

    assert_redirected_to learner_styles_url
  end
end
