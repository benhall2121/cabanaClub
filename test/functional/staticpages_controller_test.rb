require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  setup do
    @staticpage = staticpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staticpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staticpage" do
    assert_difference('Staticpage.count') do
      post :create, staticpage: { page_body: @staticpage.page_body, page_name: @staticpage.page_name, page_title: @staticpage.page_title }
    end

    assert_redirected_to staticpage_path(assigns(:staticpage))
  end

  test "should show staticpage" do
    get :show, id: @staticpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staticpage
    assert_response :success
  end

  test "should update staticpage" do
    put :update, id: @staticpage, staticpage: { page_body: @staticpage.page_body, page_name: @staticpage.page_name, page_title: @staticpage.page_title }
    assert_redirected_to staticpage_path(assigns(:staticpage))
  end

  test "should destroy staticpage" do
    assert_difference('Staticpage.count', -1) do
      delete :destroy, id: @staticpage
    end

    assert_redirected_to staticpages_path
  end
end
