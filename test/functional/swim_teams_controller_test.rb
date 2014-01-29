require 'test_helper'

class SwimTeamsControllerTest < ActionController::TestCase
  setup do
    @swim_team = swim_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swim_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swim_team" do
    assert_difference('SwimTeam.count') do
      post :create, swim_team: { description: @swim_team.description, end_age: @swim_team.end_age, end_date: @swim_team.end_date, name: @swim_team.name, num_allowed_participants: @swim_team.num_allowed_participants, price_per_participant: @swim_team.price_per_participant, start_age: @swim_team.start_age, start_date: @swim_team.start_date }
    end

    assert_redirected_to swim_team_path(assigns(:swim_team))
  end

  test "should show swim_team" do
    get :show, id: @swim_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swim_team
    assert_response :success
  end

  test "should update swim_team" do
    put :update, id: @swim_team, swim_team: { description: @swim_team.description, end_age: @swim_team.end_age, end_date: @swim_team.end_date, name: @swim_team.name, num_allowed_participants: @swim_team.num_allowed_participants, price_per_participant: @swim_team.price_per_participant, start_age: @swim_team.start_age, start_date: @swim_team.start_date }
    assert_redirected_to swim_team_path(assigns(:swim_team))
  end

  test "should destroy swim_team" do
    assert_difference('SwimTeam.count', -1) do
      delete :destroy, id: @swim_team
    end

    assert_redirected_to swim_teams_path
  end
end
