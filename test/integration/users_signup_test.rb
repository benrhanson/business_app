require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { first_name:  "",
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
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { first_name:  "Bob",
                               last_name: "Dole",
                               email: "dole@gop.gov",
                               password:              "bobdole19",
                               password_confirmation: "bobdole19",
                               phone: "555-555-5555",
                               address: "123 Nowhere Street", 
                               zip_code: "99999",
                               city: "Topeka",
                               state: "Kansas",
                               career: "Retired Senator",
                               experience: "30 Years",
                               years_at_job: "20",
                               bio: "I ran for President, lost to Bill Clinton. I was a Senator for Kanasas from 1969-1996." }
    end
    assert_template 'users/show'
  end
  
end