require 'test_helper'

class UserTest < ActiveSupport::TestCase

def setup
  @user = User.new(first_name: "Bob", last_name: "Dole", email: "bob@gop.gov", password: "dole1945", password_confirmation: "dole1945", phone: "555-555-5555", address: "123 Nowhere Lane", zip_code: "98999", city: "Podunk", state: "Idaho", career: "Former Politician, medicine spokesman", experience: "40 years", years_at_job: "5", bio: "Bob Dole. Bob Dole. Bob Dole.")
end

test "should be valid" do
  assert @user.valid?
end

test "first_name should be present" do
  @user.first_name = ""
  assert_not @user.valid?
end

test "last_name should be present" do
  @user.last_name = "   "
  assert_not @user.valid?
end

test "email should be present" do
  @user.email = "    "
  assert_not @user.valid?
end

test "first_name should not be too long" do
  @user.first_name = "a" * 51
  assert_not @user.valid?
end

test "last_name should not be too long" do
  @user.last_name = "a" * 51
  assert_not @user.valid?
end

test "email should not be too long" do
  @user.email = "a" * 244 + "@example.com"
  assert_not @user.valid?
end

test "phone number should be present" do
  @user.phone = "   "
  assert_not @user.valid?
end

test "address should be present" do
  @user.address = "   "
  assert_not @user.valid?
end

test "zip_code should be present" do
  @user.zip_code = "  "
  assert_not @user.valid?
end

test "city should be present" do
  @user.city = "  "
  assert_not @user.valid?
end

test "state should be present" do
  @user.state = "  "
  assert_not @user.valid?
end

test "career should be present" do
  @user.career = "  "
  assert_not @user.valid?
end

test "experience should be present" do
  @user.experience = "  "
  assert_not @user.valid?
end

test "years_at_job should be present" do
  @user.years_at_job = "  "
  assert_not @user.valid?
end

test "bio should be present" do
  @user.bio = "  "
  assert_not @user.valid?
end

# email format validations

test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
    @user.email = valid_address
    assert @user.valid?, "#{valid_address.inspect} should be valid"
  end
end

test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
    @user.email = invalid_address
    assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  end
end

test "email addresses should be unique" do
  duplicate_user = @user.dup
  duplicate_user.email = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
end

# password validations
test "password should be present (nonblank)" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
end

test "password should have a minimum length" do
  @user.password = @user.password_confirmation = "a" * 7
  assert_not @user.valid?
end

end
