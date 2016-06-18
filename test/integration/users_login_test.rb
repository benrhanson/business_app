require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:yorgi)
  end

  test "login with invalid information" do
    # go to the login page
    get login_path
    # load the proper template
    assert_template 'sessions/new'
    # spoofs a fake user with an empty email and password
    post login_path, session: { email: "", password: "" }
    # after the fake user fails to log in reloads the login template
    assert_template 'sessions/new'
    # is the flash message empty on the login page?
    assert_not flash.empty?
    # goes to the main page
    get root_path
    # is the flash message empty?
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    # go to the login page
    get login_path
    # submits a login request with the fixed user's info
    post login_path, session: { email: @user.email, password: 'password' }
    # is the user logged in?
    assert is_logged_in?
    # is the signed in user redirected to the user profile page?
    assert_redirected_to @user
    # go to the redirected page
    follow_redirect!
    # is the template there?
    assert_template 'users/show'
    # are the login, logout and user paths present?
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0    
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end

end
