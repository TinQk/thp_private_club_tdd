require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(fname: "Example_fname", lname: "Example_lname", email: "example@gmail.com")
  end

# TEST INITIAL

  test "user should be valid" do
    assert @user.valid?
  end

# TESTS FNAME

  test "fname should be present" do
    @user.fname = ""
    assert_not @user.valid?
  end

  test "fname should not be fill by spaces" do
    @user.fname = "      "
    assert_not @user.valid?
  end

# TESTS LNAME

  test "lname should be present" do
    @user.lname = ""
    assert_not @user.valid?
  end

  test "lname should not be fill by spaces" do
    @user.lname = "      "
    assert_not @user.valid?
  end


# TESTS EMAILS (copied from Listing 6.18 and 6.19 : https://www.railstutorial.org/book/modeling_users)

  test "email should not be too long" do
    @user.email = "a" * 244 + "@exemple.com"
    assert_not @user.valid?
  end

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



end
