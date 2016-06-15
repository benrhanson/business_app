require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
    assert_select "title", "Welcome"
  end

  test "should get videos" do
    get :videos
    assert_response :success
    assert_select "title", "What We Do"
  end

end
