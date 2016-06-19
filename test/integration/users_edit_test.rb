require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:yorgi)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { first_name:  "",
                                    last_name: "",
                                    email: "user@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar",
                                    phone: "",
                                    address: "", 
                                    zip_code: "",
                                    city: "",
                                    state: "",
                                    career: "",
                                    experience: "",
                                    years_at_job: "",
                                    bio: "" }
    assert_template 'users/edit'
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    first_name = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { first_name:  first_name,
                                    last_name: last_name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "",
                                    phone: "55555555555",
                                    address: "123 1st ct ne", 
                                    zip_code: "99999",
                                    city: "Anywhere",
                                    state: "USA",
                                    career: "example",
                                    experience: "1",
                                    years_at_job: "1",
                                    bio: "I am an example salesman" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal first_name,  @user.first_name
    assert_equal email, @user.email
  end 
  
end
