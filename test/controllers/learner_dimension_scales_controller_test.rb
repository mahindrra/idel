require 'test_helper'

class LearnerDimensionScalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learner_dimension_scale = learner_dimension_scales(:one)
  end

  test "should get index" do
    get learner_dimension_scales_url
    assert_response :success
  end

  test "should get new" do
    get new_learner_dimension_scale_url
    assert_response :success
  end

  test "should create learner_dimension_scale" do
    assert_difference('LearnerDimensionScale.count') do
      post learner_dimension_scales_url, params: { learner_dimension_scale: { learner_style_id: @learner_dimension_scale.learner_style_id, name: @learner_dimension_scale.name } }
    end

    assert_redirected_to learner_dimension_scale_url(LearnerDimensionScale.last)
  end

  test "should show learner_dimension_scale" do
    get learner_dimension_scale_url(@learner_dimension_scale)
    assert_response :success
  end

  test "should get edit" do
    get edit_learner_dimension_scale_url(@learner_dimension_scale)
    assert_response :success
  end

  test "should update learner_dimension_scale" do
    patch learner_dimension_scale_url(@learner_dimension_scale), params: { learner_dimension_scale: { learner_style_id: @learner_dimension_scale.learner_style_id, name: @learner_dimension_scale.name } }
    assert_redirected_to learner_dimension_scale_url(@learner_dimension_scale)
  end

  test "should destroy learner_dimension_scale" do
    assert_difference('LearnerDimensionScale.count', -1) do
      delete learner_dimension_scale_url(@learner_dimension_scale)
    end

    assert_redirected_to learner_dimension_scales_url
  end
end
