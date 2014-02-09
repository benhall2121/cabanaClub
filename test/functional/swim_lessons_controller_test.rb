require 'test_helper'

class SwimLessonsControllerTest < ActionController::TestCase
  setup do
    @swim_lesson = swim_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swim_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swim_lesson" do
    assert_difference('SwimLesson.count') do
      post :create, swim_lesson: { active: @swim_lesson.active, description: @swim_lesson.description, end_age: @swim_lesson.end_age, end_date: @swim_lesson.end_date, end_time: @swim_lesson.end_time, fri: @swim_lesson.fri, mon: @swim_lesson.mon, name: @swim_lesson.name, num_allowed_participants: @swim_lesson.num_allowed_participants, price_per_participant: @swim_lesson.price_per_participant, sat: @swim_lesson.sat, start_age: @swim_lesson.start_age, start_date: @swim_lesson.start_date, start_time: @swim_lesson.start_time, sun: @swim_lesson.sun, thurs: @swim_lesson.thurs, tues: @swim_lesson.tues, wed: @swim_lesson.wed }
    end

    assert_redirected_to swim_lesson_path(assigns(:swim_lesson))
  end

  test "should show swim_lesson" do
    get :show, id: @swim_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swim_lesson
    assert_response :success
  end

  test "should update swim_lesson" do
    put :update, id: @swim_lesson, swim_lesson: { active: @swim_lesson.active, description: @swim_lesson.description, end_age: @swim_lesson.end_age, end_date: @swim_lesson.end_date, end_time: @swim_lesson.end_time, fri: @swim_lesson.fri, mon: @swim_lesson.mon, name: @swim_lesson.name, num_allowed_participants: @swim_lesson.num_allowed_participants, price_per_participant: @swim_lesson.price_per_participant, sat: @swim_lesson.sat, start_age: @swim_lesson.start_age, start_date: @swim_lesson.start_date, start_time: @swim_lesson.start_time, sun: @swim_lesson.sun, thurs: @swim_lesson.thurs, tues: @swim_lesson.tues, wed: @swim_lesson.wed }
    assert_redirected_to swim_lesson_path(assigns(:swim_lesson))
  end

  test "should destroy swim_lesson" do
    assert_difference('SwimLesson.count', -1) do
      delete :destroy, id: @swim_lesson
    end

    assert_redirected_to swim_lessons_path
  end
end
