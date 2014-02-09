require 'test_helper'

class UserswimlessonsControllerTest < ActionController::TestCase
  setup do
    @userswimlesson = userswimlessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userswimlessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userswimlesson" do
    assert_difference('Userswimlesson.count') do
      post :create, userswimlesson: { payment_id: @userswimlesson.payment_id, swim_lesson_id: @userswimlesson.swim_lesson_id, user_id: @userswimlesson.user_id }
    end

    assert_redirected_to userswimlesson_path(assigns(:userswimlesson))
  end

  test "should show userswimlesson" do
    get :show, id: @userswimlesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userswimlesson
    assert_response :success
  end

  test "should update userswimlesson" do
    put :update, id: @userswimlesson, userswimlesson: { payment_id: @userswimlesson.payment_id, swim_lesson_id: @userswimlesson.swim_lesson_id, user_id: @userswimlesson.user_id }
    assert_redirected_to userswimlesson_path(assigns(:userswimlesson))
  end

  test "should destroy userswimlesson" do
    assert_difference('Userswimlesson.count', -1) do
      delete :destroy, id: @userswimlesson
    end

    assert_redirected_to userswimlessons_path
  end
end
