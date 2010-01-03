require 'test_helper'

class NewsEntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_entry" do
    assert_difference('NewsEntry.count') do
      post :create, :news_entry => { }
    end

    assert_redirected_to news_entry_path(assigns(:news_entry))
  end

  test "should show news_entry" do
    get :show, :id => news_entries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => news_entries(:one).to_param
    assert_response :success
  end

  test "should update news_entry" do
    put :update, :id => news_entries(:one).to_param, :news_entry => { }
    assert_redirected_to news_entry_path(assigns(:news_entry))
  end

  test "should destroy news_entry" do
    assert_difference('NewsEntry.count', -1) do
      delete :destroy, :id => news_entries(:one).to_param
    end

    assert_redirected_to news_entries_path
  end
end
