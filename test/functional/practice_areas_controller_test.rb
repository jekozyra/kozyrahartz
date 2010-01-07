require 'test_helper'

class PracticeAreasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_area" do
    assert_difference('PracticeArea.count') do
      post :create, :practice_area => { }
    end

    assert_redirected_to practice_area_path(assigns(:practice_area))
  end

  test "should show practice_area" do
    get :show, :id => practice_areas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => practice_areas(:one).to_param
    assert_response :success
  end

  test "should update practice_area" do
    put :update, :id => practice_areas(:one).to_param, :practice_area => { }
    assert_redirected_to practice_area_path(assigns(:practice_area))
  end

  test "should destroy practice_area" do
    assert_difference('PracticeArea.count', -1) do
      delete :destroy, :id => practice_areas(:one).to_param
    end

    assert_redirected_to practice_areas_path
  end
end
