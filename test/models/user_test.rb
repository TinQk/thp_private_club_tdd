require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(fname: "Example_fname", lname: "Example_lname", email: "Example_email")
  end

  test "should be valid" do
    assert @user.valid?
  end

end
