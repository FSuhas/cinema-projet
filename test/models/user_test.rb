require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    if assert_not user.save
      puts "Good, the user was not saved without an email"
    else
      puts "User was saved without an email"
    end
  end
end
