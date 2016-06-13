require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
    assert_select "Welcome to Business Referral Alliance!"
  end

  test "should get videos" do
    get :videos
    assert_response :success
    assert_select "What is Business Referral Alliance?"
  end

end
