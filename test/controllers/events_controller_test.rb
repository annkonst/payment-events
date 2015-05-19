require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get my_events" do
    get :my_events
    assert_response :success
  end

  test "should get invites" do
    get :invites
    assert_response :success
  end

end
