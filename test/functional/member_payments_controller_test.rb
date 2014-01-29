require 'test_helper'

class MemberPaymentsControllerTest < ActionController::TestCase
  setup do
    @member_payment = member_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_payment" do
    assert_difference('MemberPayment.count') do
      post :create, member_payment: { active: @member_payment.active, cost: @member_payment.cost, name: @member_payment.name }
    end

    assert_redirected_to member_payment_path(assigns(:member_payment))
  end

  test "should show member_payment" do
    get :show, id: @member_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_payment
    assert_response :success
  end

  test "should update member_payment" do
    put :update, id: @member_payment, member_payment: { active: @member_payment.active, cost: @member_payment.cost, name: @member_payment.name }
    assert_redirected_to member_payment_path(assigns(:member_payment))
  end

  test "should destroy member_payment" do
    assert_difference('MemberPayment.count', -1) do
      delete :destroy, id: @member_payment
    end

    assert_redirected_to member_payments_path
  end
end
