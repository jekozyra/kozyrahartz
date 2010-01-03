require 'test_helper'

class AttorneysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attorneys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attorney" do
    assert_difference('Attorney.count') do
      post :create, :attorney => { }
    end

    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should show attorney" do
    get :show, :id => attorneys(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => attorneys(:one).to_param
    assert_response :success
  end

  test "should update attorney" do
    put :update, :id => attorneys(:one).to_param, :attorney => { }
    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should destroy attorney" do
    assert_difference('Attorney.count', -1) do
      delete :destroy, :id => attorneys(:one).to_param
    end

    assert_redirected_to attorneys_path
  end
end
