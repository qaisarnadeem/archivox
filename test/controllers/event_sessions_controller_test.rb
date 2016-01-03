require 'test_helper'

class EventSessionsControllerTest < ActionController::TestCase
  setup do
    @event_session = event_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_session" do
    assert_difference('EventSession.count') do
      post :create, event_session: { code: @event_session.code, created_by: @event_session.created_by, status: @event_session.status, title: @event_session.title }
    end

    assert_redirected_to event_session_path(assigns(:event_session))
  end

  test "should show event_session" do
    get :show, id: @event_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_session
    assert_response :success
  end

  test "should update event_session" do
    patch :update, id: @event_session, event_session: { code: @event_session.code, created_by: @event_session.created_by, status: @event_session.status, title: @event_session.title }
    assert_redirected_to event_session_path(assigns(:event_session))
  end

  test "should destroy event_session" do
    assert_difference('EventSession.count', -1) do
      delete :destroy, id: @event_session
    end

    assert_redirected_to event_sessions_path
  end
end
