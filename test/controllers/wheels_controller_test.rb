require 'test_helper'

class WheelsControllerTest < ActionController::TestCase
  setup do
    @wheel = wheels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wheels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wheel" do
    assert_difference('Wheel.count') do
      post :create, wheel: { like: @wheel.like }
    end

    assert_redirected_to wheel_path(assigns(:wheel))
  end

  test "should show wheel" do
    get :show, id: @wheel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wheel
    assert_response :success
  end

  test "should update wheel" do
    patch :update, id: @wheel, wheel: { like: @wheel.like }
    assert_redirected_to wheel_path(assigns(:wheel))
  end

  test "should destroy wheel" do
    assert_difference('Wheel.count', -1) do
      delete :destroy, id: @wheel
    end

    assert_redirected_to wheels_path
  end
end
